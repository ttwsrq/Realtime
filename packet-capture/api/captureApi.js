import { supabase } from "../../shared/utils/supabaseClient.js";

export async function savePacket({ srcIp, dstIp, srcPort, dstPort, protocol, encryption, sizeBytes, payloadPreview }) {
  const { data, error } = await supabase
    .from("packets")
    .insert({
      src_ip: srcIp,
      dst_ip: dstIp,
      src_port: srcPort,
      dst_port: dstPort,
      protocol,
      encryption,
      size_bytes: sizeBytes,
      payload_preview: payloadPreview,
      status: "captured",
    })
    .select().single();
  if (error) throw error;
  return data;
}

export function subscribeToNewPackets(callback) {
  return supabase
    .channel("packets-realtime")
    .on("postgres_changes", { event: "INSERT", schema: "public", table: "packets" }, callback)
    .subscribe();
}

export async function updatePacketStatus(id, status) {
  const { error } = await supabase
    .from("packets")
    .update({ status, analyzed_at: new Date().toISOString() })
    .eq("id", id);
  if (error) throw error;
}
