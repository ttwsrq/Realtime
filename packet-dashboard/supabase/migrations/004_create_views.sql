Dashboard Stats (Materialized View)
CREATE MATERIALIZED VIEW IF NOT EXISTS public.dashboard_stats AS
SELECT
  COUNT(*)                                        AS total_packets,
  COUNT(*) FILTER (WHERE encryption != 'NONE')   AS encrypted_packets,
  COUNT(*) FILTER (WHERE encryption = 'NONE')    AS unencrypted_packets,
  COUNT(DISTINCT src_ip)                          AS unique_sources,
  SUM(size_bytes)                                 AS total_bytes,
  MAX(captured_at)                                AS last_capture_at
FROM public.packets;

CREATE UNIQUE INDEX ON public.dashboard_stats ((1));

-- Protocol breakdown
CREATE OR REPLACE VIEW public.protocol_breakdown AS
SELECT
  protocol,
  COUNT(*) AS packet_count,
  SUM(size_bytes) AS total_bytes,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM public.packets
GROUP BY protocol
ORDER BY packet_count DESC;

-- Encryption trend รายชั่วโมง
CREATE OR REPLACE VIEW public.encryption_trend AS
SELECT
  DATE_TRUNC('hour', captured_at) AS hour,
  encryption,
  COUNT(*) AS packet_count
FROM public.packets
WHERE captured_at >= NOW() - INTERVAL '24 hours'
GROUP BY 1, 2
ORDER BY 1 ASC, 2;
