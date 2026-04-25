INSERT INTO public.packets (src_ip, dst_ip, src_port, dst_port, protocol, encryption, size_bytes, status) VALUES
  ('192.168.1.10', '8.8.8.8',       52341, 443, 'HTTPS', 'TLS1.3', 1024, 'analyzed'),
  ('192.168.1.11', '8.8.4.4',       53,    53,  'DNS',   'NONE',   64,   'analyzed'),
  ('10.0.0.5',     '142.250.4.46',  45012, 443, 'HTTPS', 'TLS1.2', 2048, 'stored'),
  ('192.168.1.15', '10.0.0.1',      22,    22,  'SSH',   'TLS1.3', 512,  'captured'),
  ('172.16.0.3',   '93.184.216.34', 80,    80,  'HTTP',  'NONE',   768,  'analyzed');
