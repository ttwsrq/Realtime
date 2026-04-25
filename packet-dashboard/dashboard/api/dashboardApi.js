Dashboard & Charts API
import { supabase } from "../../shared/utils/supabaseClient.js";

export async function getDashboardStats() {
  const { data, error } = await supabase.from("dashboard_stats").select("*").single();
  if (error) throw error;
  return data;
}

export async function getProtocolChart() {
  const { data, error } = await supabase.from("protocol_breakdown").select("*");
  if (error) throw error;
  return data;
}

export async function getEncryptionTrend() {
  const { data, error } = await supabase.from("encryption_trend").select("*");
  if (error) throw error;
  return data;
}
