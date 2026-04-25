# Real-time Encrypted Packet Visualization Dashboard

## โครงสร้างโปรเจกต์

```
realtime-packet-dashboard/
├── src/
│   ├── api/                  ← API functions ทั้งหมด
│   │   ├── captureApi.js
│   │   ├── dashboardApi.js
│   │   ├── encryptionApi.js
│   │   ├── historyApi.js
│   │   ├── protocolApi.js
│   │   └── userApi.js
│   ├── components/           ← UI components (เพิ่มเมื่อมีไฟล์จริง)
│   ├── hooks/                ← Custom hooks (เพิ่มเมื่อมีไฟล์จริง)
│   └── shared/
│       ├── constants.js      ← PROTOCOLS, ENCRYPTION_TYPES, USER_ROLES
│       ├── types.js          ← JSDoc type definitions
│       └── supabaseClient.js ← Supabase client instances
├── supabase/
│   ├── migrations/
│   │   ├── 001_create_users_table.sql
│   │   ├── 002_create_packets_table.sql
│   │   ├── 003_create_encryption_logs_table.sql
│   │   └── 004_create_views.sql
│   └── seed/
│       └── seed.sql
├── .env.example
├── .gitignore
├── package.json
└── README.md
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

# 5. รัน dev server
npm run dev
```

## Import Paths

```js
// จาก src/api/*.js
import { supabase } from '../shared/supabaseClient.js';
import { PROTOCOLS } from '../shared/constants.js';
```
