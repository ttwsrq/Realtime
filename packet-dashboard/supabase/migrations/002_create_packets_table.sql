Packet Capture
CREATE TABLE IF NOT EXISTS public.packets (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  captured_at TIMESTAMPTZ DEFAULT NOW(),
  src_ip INET NOT NULL,
  dst_ip INET NOT NULL,
  src_port INTEGER CHECK (src_port BETWEEN 0 AND 65535),
  dst_port INTEGER CHECK (dst_port BETWEEN 0 AND 65535),
  protocol TEXT NOT NULL CHECK (protocol IN ('TCP', 'UDP', 'HTTP', 'HTTPS', 'DNS', 'SSH')),
  encryption TEXT NOT NULL DEFAULT 'NONE' CHECK (encryption IN ('TLS1.2', 'TLS1.3', 'SSL3.0', 'NONE')),
  size_bytes INTEGER NOT NULL DEFAULT 0,
  payload_preview TEXT,
  status TEXT NOT NULL DEFAULT 'captured' CHECK (status IN ('captured', 'analyzed', 'stored')),
  analyzed_at TIMESTAMPTZ,
  created_by UUID REFERENCES public.profiles(id)
);

CREATE INDEX idx_packets_captured_at ON public.packets(captured_at DESC);
CREATE INDEX idx_packets_protocol ON public.packets(protocol);
CREATE INDEX idx_packets_encryption ON public.packets(encryption);

ALTER TABLE public.packets ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Authenticated users can read packets"
  ON public.packets FOR SELECT
  USING (auth.role() = 'authenticated');

CREATE POLICY "Admins can insert packets"
  ON public.packets FOR INSERT
  WITH CHECK (
    EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin')
  );
