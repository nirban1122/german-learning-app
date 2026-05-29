<div align="center">
  <img src="https://img.icons8.com/color/96/000000/germany.png" alt="Germany Flag" width="80"/>

  # 🇩🇪 German Learning App

  ### AI-Powered Language Learning Platform

  <p align="center">
    <strong>Learn German smarter</strong> — with AI-generated lessons, real-time conversation practice,<br>
    speaking & writing feedback, and a powerful admin training system.
  </p>

  <p align="center">
    <a href="#-features"><strong>Explore Features</strong></a> ·
    <a href="#-architecture"><strong>Architecture</strong></a> ·
    <a href="#-tech-stack"><strong>Tech Stack</strong></a> ·
    <a href="#-getting-started"><strong>Getting Started</strong></a>
  </p>

  <p align="center">
    <img src="https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB" alt="React"/>
    <img src="https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white" alt="Node.js"/>
    <img src="https://img.shields.io/badge/Express-000000?style=for-the-badge&logo=express&logoColor=white" alt="Express"/>
    <img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL"/>
    <img src="https://img.shields.io/badge/Prisma-2D3748?style=for-the-badge&logo=prisma&logoColor=white" alt="Prisma"/>
    <img src="https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white" alt="Tailwind CSS"/>
  </p>

  <p align="center">
    <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License: MIT"/>
    <img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg" alt="PRs Welcome"/>
  </p>
</div>

---

## ✨ Features

<table>
  <tr>
    <td align="center" width="33%">
      <h3>🎓 Interactive Courses</h3>
      <p>Structured German lessons from A1 to C1 with exercises, quizzes, and progress tracking.</p>
    </td>
    <td align="center" width="33%">
      <h3>🤖 AI Conversation Tutor</h3>
      <p>Practice real German conversations with AI. Get instant feedback on grammar and vocabulary.</p>
    </td>
    <td align="center" width="33%">
      <h3>🎤 Speaking Practice</h3>
      <p>Record your voice and receive AI-powered pronunciation analysis and fluency scoring.</p>
    </td>
  </tr>
  <tr>
    <td align="center" width="33%">
      <h3>✍️ Writing Grader</h3>
      <p>Submit written German and get detailed AI evaluation on grammar, vocabulary, structure, and coherence.</p>
    </td>
    <td align="center" width="33%">
      <h3>📖 Reading Passages</h3>
      <p>AI-generated reading material tailored to your level with comprehension questions.</p>
    </td>
    <td align="center" width="33%">
      <h3>📚 Vocabulary Drills</h3>
      <p>AI-powered vocabulary lists with example sentences, mnemonics, and spaced repetition.</p>
    </td>
  </tr>
</table>

### 🛠️ Admin Panel Features

| Feature | Description |
|---------|-------------|
| **Content Management** | Full CRUD for courses, lessons, exercises, and quizzes |
| **User Management** | View, edit, and manage student accounts |
| **Media Library** | Upload and manage images, audio, and other media |
| **Analytics Dashboard** | Track user engagement, course performance, and progress |
| **AI Training System** | Upload few-shot examples, edit prompt templates, preview AI output |

---

## 🏗️ Architecture

```
german-learning-app/
├── frontend/           # Student-facing React SPA
│   ├── pages/          # Home, Courses, Lesson, Quiz, AI Chat, etc.
│   ├── components/     # Navbar, Footer, AITutorBadge, VoiceRecorder, etc.
│   ├── hooks/          # useAuth, useAIChat, useSpeechRecognition, etc.
│   └── store/          # Zustand state management
│
├── admin/              # Admin Panel (WordPress-like)
│   ├── pages/          # Dashboard, course/lesson/exercise/quiz management
│   ├── components/     # DataTable, FormBuilder, AIPreview, etc.
│   └── api/            # Admin API clients
│
├── backend/            # Node.js + Express API server
│   ├── routes/         # REST API routes (auth, courses, ai, admin, etc.)
│   ├── controllers/    # Business logic
│   ├── services/       # AI service layer (LessonAIService, etc.)
│   ├── middleware/      # Auth, permissions, rate limiting, error handling
│   └── prisma/         # Database schema and migrations
│
├── ai-engine/          # Core AI Engine
│   ├── providers/      # Gemini, Groq, OpenRouter, Cerebras integrations
│   ├── training/       # Prompt templates, few-shot examples
│   └── evaluation/     # Grammar checking, pronunciation scoring, writing grading
│
├── docker-compose.yml  # VPS deployment with Coolify
├── Dockerfile          # Multi-stage Docker build
└── render.yaml         # Render.com deployment config
```

### AI Provider Stack

| Provider | Model | Best For | Daily Limit | Cost |
|----------|-------|----------|-------------|------|
| **Google Gemini** | Gemini 2.5 Flash | Lesson generation, content creation | ~1,500 req/day | Free |
| **Groq** | Llama 3.3 70B | Real-time chat / conversation | ~1,000 req/day | Free |
| **OpenRouter** | Multiple models | Testing & fallback | ~200 req/day | Free |
| **SambaNova** | DeepSeek R1 | Grammar explanations | Free tier | Free |
| **Cerebras** | Llama 3.3 70B | Batch evaluation | ~1,700 req/day | Free |

> 🎯 **Total free capacity:** ~3,500–5,000 requests/day — enough for ~1,000–1,500 active users.

---

## 🛠️ Tech Stack

### Frontend
- **React 18 + Vite** — Modern SPA framework
- **Tailwind CSS** — Utility-first styling
- **Zustand** — Lightweight state management
- **React Router v6** — Client-side routing
- **Axios** — HTTP client

### Backend
- **Node.js + Express** — REST API server
- **Prisma ORM** — Type-safe database access
- **PostgreSQL** — Primary database
- **JWT** — Authentication
- **Multer / Sharp** — Media upload & processing

### AI Engine
- **Google Gemini API** — Primary AI provider
- **Groq API** — Real-time chat
- **OpenRouter API** — Fallback provider
- **Prompt Engineering + Few-Shot Learning** — No expensive fine-tuning needed

### Hosting
- **Development:** Render (free tier) + Supabase (free PostgreSQL)
- **Production:** Hetzner VPS + Coolify (self-hosted deployment)

---

## 🚀 Getting Started

### Prerequisites

- Node.js 18+ 
- npm or yarn
- PostgreSQL (or Supabase account)
- Free API keys: [Google AI Studio](https://aistudio.google.com/), [Groq](https://console.groq.com/), [Supabase](https://supabase.com/)

### Installation

```bash
# Clone the repository
git clone https://github.com/nirban1122/german-learning-app.git
cd german-learning-app

# Backend setup
cd backend
cp .env.example .env
# Edit .env with your database URL and API keys
npm install
npx prisma migrate dev
npm run dev

# Frontend setup (new terminal)
cd ../frontend
npm install
npm run dev

# Admin panel setup (new terminal)
cd ../admin
npm install
npm run dev
```

### Environment Variables

```bash
# Database
DATABASE_URL="postgresql://user:password@host:5432/germanapp"

# AI Providers
GEMINI_API_KEY="your-gemini-api-key"
GROQ_API_KEY="your-groq-api-key"
OPENROUTER_API_KEY="your-openrouter-api-key"

# Auth
JWT_SECRET="your-jwt-secret"
JWT_EXPIRES_IN="7d"

# App
NODE_ENV="development"
FRONTEND_URL="http://localhost:5173"
ADMIN_URL="http://localhost:5174"
PORT=5000
```

---

## 🚢 Deployment

### Option 1: Render (Free — Development)

Deploy instantly using `render.yaml` — free tier with auto-deploy from GitHub.

### Option 2: VPS + Coolify (Production — ~$5-25/month)

```bash
# Provision a Hetzner VPS (CX22, €4.99/mo)

# SSH in and install Coolify
curl -fsSL https://cdn.coollabs.io/coolify/install.sh | bash

# Connect your GitHub repo and deploy with one click
```

The `docker-compose.yml` and `Dockerfile` are pre-configured for Coolify deployment with automatic SSL, PostgreSQL, and all services.

---

## 📊 Cost Breakdown

### Development ($0/month)
| Service | What | Cost |
|---------|------|------|
| Render | Frontend + Backend | Free |
| Supabase | PostgreSQL + Auth | Free |
| Google Gemini | AI provider | Free |
| Groq | AI provider | Free |
| Cloudinary | Media hosting | Free |

### Production (~$10–25/month)
| Service | What | Cost |
|---------|------|------|
| Hetzner VPS | 2 vCPU, 4GB RAM, 40GB SSD | ~€4.99/mo |
| Coolify | Self-hosted deployment | Free |
| DeepSeek V4 API | Production AI | ~$5-20/mo |

---

## 🧠 Admin AI Training System

The admin panel includes a powerful AI training dashboard that lets you:

1. **Edit prompt templates** — customize how the AI generates content
2. **Upload few-shot examples** — train the AI with your own high-quality lessons
3. **Preview AI output** — review generated content before publishing
4. **Configure providers** — set priority order and fallback logic
5. **Track usage** — monitor API costs and usage analytics

> No expensive fine-tuning needed — the system uses prompt engineering + few-shot learning for instant, controllable AI training.

---

## 🗺️ Roadmap

- [x] Project scaffolding & architecture design
- [ ] Phase 1: Foundation — Database, auth, basic server & frontend
- [ ] Phase 2: Core Features — Courses, lessons, exercises, quizzes
- [ ] Phase 3: Admin Panel — Content & user management
- [ ] Phase 4: AI Integration — Lesson generator, chat tutor, speaking/writing feedback
- [ ] Phase 5: AI Training System — Prompt editor, few-shot learning dashboard
- [ ] Phase 6: Production — VPS migration, CI/CD, performance optimization

---

## 🤝 Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

<div align="center">
  <p>Built with ❤️ for German learners everywhere</p>
  <p>
    <a href="https://github.com/nirban1122">@nirban1122</a> ·
    <a href="#">Report Bug</a> ·
    <a href="#">Request Feature</a>
  </p>
</div>
