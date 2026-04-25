import { supabase } from "../shared/supabaseClient.js";

export async function getProtocolBreakdown() {
  const { data, error } = await supabase.from("protocol_breakdown").select("*");
  if (error) throw error;
  return data;
}

export async function getPacketsByProtocol(protocol, limit = 100) {
  const { data, error } = await supabase
    .from("packets").select("*").eq("protocol", protocol)
    .order("captured_at", { ascending: false }).limit(limit);
  if (error) throw error;
  return data;
}
