CREATE TABLE IF NOT EXISTS public.encryption_logs (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  packet_id UUID REFERENCES public.packets(id) ON DELETE CASCADE,
  detected_at TIMESTAMPTZ DEFAULT NOW(),
  encryption_version TEXT NOT NULL,
  cipher_suite TEXT,
  handshake_time_ms INTEGER,
  is_valid BOOLEAN DEFAULT TRUE,
  notes TEXT
);

CREATE INDEX idx_enc_logs_packet_id ON public.encryption_logs(packet_id);
CREATE INDEX idx_enc_logs_detected_at ON public.encryption_logs(detected_at DESC);

ALTER TABLE public.encryption_logs ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Authenticated users can read encryption logs"
  ON public.encryption_logs FOR SELECT
  USING (auth.role() = 'authenticated');

CREATE POLICY "Admins can write encryption logs"
  ON public.encryption_logs FOR INSERT
  WITH CHECK (
    EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin')
  );
