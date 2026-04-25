# Real-time Encrypted Packet Visualization Dashboard

## โครงสร้างโปรเจกต์

```
packet-dashboard/
├── shared/                        ← ทุกคนใช้ร่วมกัน
│   ├── utils/supabaseClient.js
│   ├── types/index.js
│   └── constants/index.js
│
├── user-management/              
├── packet-history/               
├── encryption-detection/         
├── packet-capture/               
├── protocol-analysis/            
├── dashboard/                    
│
└── supabase/
    ├── migrations/                ← รันตามลำดับ 001 → 004
    └── seed/seed.sql
```

## Setup

```bash
# 1. ติดตั้ง dependencies
npm install

# 2. ตั้งค่า env
cp .env.example .env
# แก้ไข SUPABASE_URL และ SUPABASE_ANON_KEY

# 3. รัน migration ใน Supabase SQL Editor ตามลำดับ
# supabase/migrations/001 → 002 → 003 → 004

# 4. (optional) seed ข้อมูลทดสอบ
# รัน supabase/seed/seed.sql
```
