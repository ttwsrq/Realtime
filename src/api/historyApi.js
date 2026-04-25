import { supabase } from "../shared/supabaseClient.js";

export async function getPacketHistory({ page = 1, pageSize = 50, protocol, encryption } = {}) {
  let query = supabase
    .from("packets").select("*", { count: "exact" })
    .order("captured_at", { ascending: false })
    .range((page - 1) * pageSize, page * pageSize - 1);
  if (protocol) query = query.eq("protocol", protocol);
  if (encryption) query = query.eq("encryption", encryption);
  const { data, error, count } = await query;
  if (error) throw error;
  return { data, total: count, page, pageSize };
}

export async function getPacketById(id) {
  const { data, error } = await supabase
    .from("packets").select("*, encryption_logs(*)").eq("id", id).single();
  if (error) throw error;
  return data;
}
