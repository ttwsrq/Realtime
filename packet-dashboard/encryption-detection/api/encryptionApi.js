Encryption Detection API
import { supabase } from "../../shared/utils/supabaseClient.js";

export async function logEncryptionDetection({ packetId, encryptionVersion, cipherSuite, handshakeTimeMs, isValid, notes }) {
  const { data, error } = await supabase
    .from("encryption_logs")
    .insert({
      packet_id: packetId,
      encryption_version: encryptionVersion,
      cipher_suite: cipherSuite,
      handshake_time_ms: handshakeTimeMs,
      is_valid: isValid,
      notes,
    })
    .select().single();
  if (error) throw error;
  return data;
}

export async function getEncryptionLogs(packetId) {
  const { data, error } = await supabase
    .from("encryption_logs").select("*").eq("packet_id", packetId)
    .order("detected_at", { ascending: false });
  if (error) throw error;
  return data;
}
