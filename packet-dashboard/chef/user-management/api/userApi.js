// [เชฟ] User Management API
import { supabase, supabaseAdmin } from "../../../shared/utils/supabaseClient.js";

export async function getAllUsers() {
  const { data, error } = await supabase
    .from("profiles").select("*").order("created_at", { ascending: false });
  if (error) throw error;
  return data;
}

export async function updateUserRole(userId, newRole) {
  const { data, error } = await supabase
    .from("profiles")
    .update({ role: newRole, updated_at: new Date().toISOString() })
    .eq("id", userId).select().single();
  if (error) throw error;
  return data;
}

export async function deleteUser(userId) {
  const { error } = await supabaseAdmin.auth.admin.deleteUser(userId);
  if (error) throw error;
}
