# 🇩🇪 German Learning App — Complete Architecture Guide

> **AI-Powered Language Learning Platform with Admin Training System**
> Built on free APIs, hosted on Render (dev) → VPS + Coolify (production)

---

## 📋 Table of Contents

1. [Tech Stack Overview](#-tech-stack-overview)
2. [Project Structure](#-project-structure)
3. [Free API Strategy](#-free-api-strategy)
4. [Hosting Strategy](#-hosting-strategy)
5. [AI Engine Architecture](#-ai-engine-architecture)
6. [Admin Training System](#-admin-training-system)
7. [Database Schema](#-database-schema)
8. [Deployment Guide](#-deployment-guide)

---

## 🛠 Tech Stack Overview

### Frontend (Student Website)
| Technology | Purpose |
|---|---|
| **React 18 + Vite** | SPA framework |
| **Tailwind CSS** | Styling |
| **Zustand** | State management |
| **React Router v6** | Routing |
| **Axios** | HTTP client |

### Admin Panel
| Technology | Purpose |
|---|---|
| **React 18 + Vite** | SPA framework (separate app) |
| **Tailwind CSS** | Styling |
| **Zustand** | State management |
| **React Router v6** | Routing |
| **Recharts / Chart.js** | Analytics charts |
| **React-Quill / TipTap** | Rich text editor |

### Backend
| Technology | Purpose |
|---|---|
| **Node.js + Express** | Server |
| **Prisma ORM** | Database management |
| **PostgreSQL** | Database |
| **JWT** | Authentication |
| **Multer / Sharp** | Media upload & processing |
| **Nodemailer** | Email sending |

### AI Engine
| Technology | Purpose |
|---|---|
| **Google Gemini API** | Primary AI provider (free tier) |
| **Groq API** | Real-time chat (free tier) |
| **OpenRouter API** | Fallback provider (free tier) |
| **SambaNova / Cerebras** | Evaluation tasks (free tier) |

---

## 📁 Project Structure

```
german-learning-app/
│
├── frontend/                          # Student-facing website
│   └── src/
│       ├── pages/
│       │   ├── Home.jsx
│       │   ├── Dashboard.jsx
│       │   ├── Courses.jsx
│       │   ├── Lesson.jsx
│       │   ├── Exercise.jsx
│       │   ├── Quiz.jsx
│       │   ├── Profile.jsx
│       │   ├── AIChat.jsx                 ← 🆕 AI Conversation Practice
│       │   ├── SpeakingPractice.jsx       ← 🆕 Speaking with AI feedback
│       │   ├── PronunciationAnalysis.jsx  ← 🆕 Voice analysis
│       │   ├── ReadingLesson.jsx          ← 🆕 AI-generated reading
│       │   ├── WritingExercise.jsx        ← 🆕 AI-graded writing
│       │   ├── VocabularyDrills.jsx       ← 🆕 AI-powered vocab practice
│       │   └── Auth/
│       │       ├── Login.jsx
│       │       └── Register.jsx
│       ├── components/
│       │   ├── Navbar.jsx
│       │   ├── Footer.jsx
│       │   ├── AITutorBadge.jsx           ← 🆕 Floating AI tutor
│       │   ├── VoiceRecorder.jsx          ← 🆕 Speech input
│       │   ├── FeedbackCard.jsx           ← 🆕 AI feedback display
│       │   └── ProgressChart.jsx
│       ├── hooks/
│       │   ├── useAuth.js
│       │   ├── useCourses.js
│       │   ├── useProgress.js
│       │   ├── useAIChat.js              ← 🆕
│       │   ├── useSpeechRecognition.js   ← 🆕
│       │   └── useAIFeedback.js          ← 🆕
│       ├── store/
│       │   └── store.js
│       ├── utils/
│       │   └── api.js
│       └── App.jsx
│
├── admin/                               # Admin Panel (WordPress-like)
│   └── src/
│       ├── pages/
│       │   ├── AdminLogin.jsx
│       │   ├── AdminDashboard.jsx
│       │   ├── courses/
│       │   │   ├── CoursesList.jsx
│       │   │   ├── CreateCourse.jsx
│       │   │   ├── EditCourse.jsx
│       │   │   └── CourseDetails.jsx
│       │   ├── lessons/
│       │   │   ├── LessonsList.jsx
│       │   │   ├── CreateLesson.jsx
│       │   │   ├── EditLesson.jsx
│       │   │   └── LessonEditor.jsx
│       │   ├── exercises/
│       │   │   ├── ExercisesList.jsx
│       │   │   ├── CreateExercise.jsx
│       │   │   ├── EditExercise.jsx
│       │   │   └── ExerciseBuilder.jsx
│       │   ├── quizzes/
│       │   │   ├── QuizzesList.jsx
│       │   │   ├── CreateQuiz.jsx
│       │   │   ├── EditQuiz.jsx
│       │   │   └── QuizBuilder.jsx
│       │   ├── users/
│       │   │   ├── UsersList.jsx
│       │   │   ├── UserDetails.jsx
│       │   │   ├── EditUser.jsx
│       │   │   └── AdminsList.jsx
│       │   ├── media/
│       │   │   ├── MediaLibrary.jsx
│       │   │   ├── UploadMedia.jsx
│       │   │   └── MediaGrid.jsx
│       │   ├── analytics/
│       │   │   ├── Dashboard.jsx
│       │   │   ├── UserAnalytics.jsx
│       │   │   ├── CourseAnalytics.jsx
│       │   │   ├── EngagementReport.jsx
│       │   │   └── Charts.jsx
│       │   ├── settings/
│       │   │   ├── GeneralSettings.jsx
│       │   │   ├── EmailTemplates.jsx
│       │   │   ├── PaymentSettings.jsx
│       │   │   ├── NotificationSettings.jsx
│       │   │   └── BackupSettings.jsx
│       │   ├── adminManagement/
│       │   │   ├── AdminsList.jsx
│       │   │   ├── CreateAdmin.jsx
│       │   │   ├── PermissionsList.jsx
│       │   │   └── AdminLogs.jsx
│       │   └── ai-training/               ← 🆕 KEY SECTION
│       │       ├── TrainingDashboard.jsx
│       │       ├── LessonGenerator.jsx
│       │       ├── ExamGenerator.jsx
│       │       ├── VocabularyManager.jsx
│       │       ├── SpeakingScorer.jsx
│       │       ├── ReadingSets.jsx
│       │       ├── WritingPrompts.jsx
│       │       ├── HearingExercises.jsx
│       │       ├── PromptTemplates.jsx
│       │       ├── ModelConfig.jsx
│       │       └── TrainingDataUploader.jsx
│       ├── components/
│       │   ├── AdminLayout.jsx
│       │   ├── Sidebar.jsx
│       │   ├── TopBar.jsx
│       │   ├── DataTable.jsx
│       │   ├── FormBuilder.jsx
│       │   ├── RichEditor.jsx
│       │   ├── ImageUploader.jsx
│       │   ├── Modal.jsx
│       │   ├── Charts.jsx
│       │   └── AIPreview.jsx             ← 🆕 Preview AI content
│       ├── hooks/
│       │   ├── useAdminAuth.js
│       │   ├── useCourseAdmin.js
│       │   ├── useUserAdmin.js
│       │   ├── useMediaAdmin.js
│       │   └── useAITraining.js          ← 🆕
│       ├── store/
│       │   ├── adminAuthStore.js
│       │   ├── adminUIStore.js
│       │   └── adminDataStore.js
│       ├── api/
│       │   ├── adminAPI.js
│       │   ├── courseAdminAPI.js
│       │   ├── userAdminAPI.js
│       │   ├── mediaAdminAPI.js
│       │   ├── analyticsAPI.js
│       │   └── aiTrainingAPI.js          ← 🆕
│       ├── utils/
│       │   ├── adminConfig.js
│       │   ├── permissions.js
│       │   └── validators.js
│       └── App.jsx
│
├── backend/
│   └── src/
│       ├── routes/
│       │   ├── auth.js
│       │   ├── courses.js
│       │   ├── lessons.js
│       │   ├── exercises.js
│       │   ├── progress.js
│       │   ├── quizzes.js
│       │   ├── flashcards.js
│       │   ├── ai/                         ← 🆕 AI ROUTES
│       │   │   ├── generate.js
│       │   │   ├── evaluate.js
│       │   │   ├── chat.js
│       │   │   ├── speaking.js
│       │   │   ├── writing.js
│       │   │   ├── vocabulary.js
│       │   │   └── train.js
│       │   └── admin/
│       │       ├── auth.js
│       │       ├── courses.js
│       │       ├── lessons.js
│       │       ├── exercises.js
│       │       ├── quizzes.js
│       │       ├── users.js
│       │       ├── media.js
│       │       ├── analytics.js
│       │       ├── settings.js
│       │       ├── adminManagement.js
│       │       ├── emailTemplates.js
│       │       ├── backups.js
│       │       ├── logs.js
│       │       └── ai-training.js          ← 🆕
│       ├── controllers/
│       │   ├── authController.js
│       │   ├── courseController.js
│       │   ├── ai/                         ← 🆕 AI CONTROLLERS
│       │   │   ├── aiController.js
│       │   │   ├── aiProvider.js
│       │   │   ├── promptEngine.js
│       │   │   ├── trainingEngine.js
│       │   │   └── evaluationEngine.js
│       │   ├── admin/
│       │   │   ├── adminAuthController.js
│       │   │   ├── courseAdminController.js
│       │   │   ├── lessonAdminController.js
│       │   │   ├── userAdminController.js
│       │   │   ├── mediaController.js
│       │   │   ├── analyticsController.js
│       │   │   ├── settingsController.js
│       │   │   └── trainingController.js
│       │   └── ... (other controllers)
│       ├── services/                       ← 🆕 AI SERVICE LAYER
│       │   ├── ai/
│       │   │   ├── LessonAIService.js
│       │   │   ├── QuizAIService.js
│       │   │   ├── ChatAIService.js
│       │   │   ├── SpeakingAIService.js
│       │   │   ├── ReadingAIService.js
│       │   │   ├── WritingAIService.js
│       │   │   ├── HearingAIService.js
│       │   │   └── VocabularyAIService.js
│       │   ├── aiProviderRouter.js
│       │   ├── promptBuilder.js
│       │   └── contextManager.js
│       ├── middleware/
│       │   ├── auth.js
│       │   ├── adminAuth.js
│       │   ├── checkPermission.js
│       │   ├── adminLog.js
│       │   ├── errorHandler.js
│       │   ├── aiRateLimiter.js            ← 🆕
│       │   └── aiFallback.js               ← 🆕
│       ├── prisma/
│       │   └── schema.prisma
│       ├── utils/
│       │   ├── generateToken.js
│       │   ├── uploadFile.js
│       │   ├── validation.js
│       │   ├── emailSender.js
│       │   ├── aiCostTracker.js            ← 🆕
│       │   └── textToSpeech.js             ← 🆕
│       └── index.js
│
├── ai-engine/                              ← 🆕 CORE AI ENGINE
│   ├── index.js
│   ├── providers/
│   │   ├── geminiProvider.js
│   │   ├── groqProvider.js
│   │   ├── openRouterProvider.js
│   │   └── providerManager.js
│   ├── training/
│   │   ├── promptTemplates/
│   │   │   ├── lessonGeneration.json
│   │   │   ├── quizGeneration.json
│   │   │   ├── conversation.json
│   │   │   ├── vocabulary.json
│   │   │   ├── writingEval.json
│   │   │   ├── speakingEval.json
│   │   │   ├── readingEval.json
│   │   │   └── hearingEval.json
│   │   ├── fewShotExamples/
│   │   │   ├── lessons/
│   │   │   ├── quizzes/
│   │   │   └── exercises/
│   │   └── trainingDataManager.js
│   ├── evaluation/
│   │   ├── grammarChecker.js
│   │   ├── pronunciationScorer.js
│   │   ├── writingGrader.js
│   │   └── comprehensionChecker.js
│   └── config/
│       ├── apiKeys.js
│       └── providerConfig.js
│
├── render.yaml
├── docker-compose.yml
├── Dockerfile
├── .gitignore
├── .env.example
└── README.md
```

---

## 🆓 Free API Strategy

### The AI Provider Stack

Route different AI tasks to different free providers to maximize your daily allowance:

| Provider | Free Model | Daily Limit | Best For | Cost |
|---|---|---|---|---|
| **Google AI Studio** | Gemini 2.5 Flash | ~1,500 req/day | Lesson generation, content creation | $0 |
| **Groq** | Llama 3.3 70B | ~1,000 req/day | Real-time chat/conversation practice | $0 |
| **OpenRouter** | Multiple free models | ~200 req/day | Testing & fallback | $0 |
| **SambaNova** | DeepSeek R1 | Free tier | Complex grammar explanations | $0 |
| **Cerebras** | Llama 3.3 70B | ~1,700 req/day | Batch evaluation of answers | $0 |

**Total free capacity: ~3,500–5,000 requests/day** — enough for ~1,000–1,500 active users.

### Smart Routing Logic

```
Student Request
      ↓
[aiProviderRouter.js]
  ├── Lesson generation  →  Google Gemini (large context, 1M tokens)
  ├── Chat/conversation  →  Groq (ultra-low latency)
  ├── Quiz generation    →  OpenRouter (structured JSON output)
  ├── Grammar checking   →  SambaNova (reasoning-focused)
  ├── Answer evaluation  →  Cerebras (high volume)
  └── All fallback       →  Next available provider
```

### Provider Manager Failover Logic

```javascript
async function getAIResponse(taskType, prompt) {
  const providers = getPriorityOrder(taskType);
  
  for (const provider of providers) {
    try {
      if (await hasRemainingQuota(provider)) {
        return await provider.call(prompt);
      }
    } catch (error) {
      logFailure(provider, error);
      continue; // Try next provider
    }
  }
  
  // All providers exhausted — return cached or simplified response
  return getFallbackResponse(taskType, prompt);
}
```

---

## 🏠 Hosting Strategy

### Phase 1: Development (Free — $0/month)

| Service | What | Limitations | Cost |
|---|---|---|---|
| **Render** | Frontend + Backend (free tier) | Spins down after 15min idle, 750 hrs/month | $0 |
| **Supabase Free** | PostgreSQL + Auth (persistent) | 500MB DB, doesn't expire | $0 |
| **Google AI Studio** | Gemini API | 1,500 req/day | $0 |
| **Groq** | Llama 3.3 API | 1,000 req/day | $0 |
| **Cloudinary Free** | Image/video hosting | 25GB storage, 25GB bandwidth | $0 |
| **Vercel/Netlify** | Alternative for frontend | Better free tier than Render | $0 |
| **Total** | | | **$0/month** |

#### ⚠️ Important Render Free Tier Caveats

- **Cold starts:** Free services spin down after **15 minutes idle** — takes ~1 minute to wake up
- **PostgreSQL expires in 30 days** — use Supabase instead
- **1 GB storage** — very limiting for media, use Cloudinary
- **No persistent disk** — uploaded files disappear on restart
- **750 instance hours/month** — shared across all free services

### Phase 2: Production (VPS + Coolify — ~$10–25/month)

| Service | What | Cost |
|---|---|---|
| **Hetzner VPS (CX22)** | 2 vCPU, 4GB RAM, 40GB SSD | ~€4–5/month |
| **Coolify** | Self-hosted deployment (open source) | $0 |
| **DeepSeek V4 API** | Production AI ($0.30/M tokens) | ~$5–20/month |
| **Total** | | **~$10–25/month** |

### Why Coolify on a VPS?

- **Full control** — no cold starts, no arbitrary limits
- **Docker-native** — uses Docker Compose for easy deployment
- **Automatic SSL** — Let's Encrypt certificates
- **Git integration** — auto-deploys on push to GitHub/GitLab
- **Multi-service** — host frontend, admin, backend, DB all on one VPS
- **Self-healing** — auto-restarts on crash

#### VPS / Coolify Quick Setup

```bash
# 1. Provision a clean Ubuntu VPS (Hetzner, Linode, DigitalOcean)

# 2. SSH in and install Coolify
curl -fsSL https://cdn.coollabs.io/coolify/install.sh | bash

# 3. Access Coolify dashboard at http://<your-vps-ip>:8000

# 4. Connect your GitHub repo and deploy with one click
```

---

## 🧠 AI Engine Architecture

### System Design

```
┌─────────────────────────────────────────────────────────┐
│                    AI ENGINE                             │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  [API Request]                                           │
│       │                                                  │
│       ▼                                                  │
│  ┌─────────────────┐                                    │
│  │ ProviderManager  │──→ Gemini (primary)               │
│  │ (Smart Router)   │──→ Groq (real-time)               │
│  │                  │──→ OpenRouter (fallback)          │
│  └────────┬────────┘──→ Cerebras (batch)                │
│           │                                              │
│           ▼                                              │
│  ┌─────────────────┐    ┌──────────────────────┐        │
│  │  PromptBuilder   │──→│  Prompt Templates    │        │
│  │  (Builds prompts │    │  • lessonGeneration │        │
│  │   from templates)│    │  • quizGeneration   │        │
│  └────────┬────────┘    │  • conversation     │        │
│           │             │  • writingEval      │        │
│           │             │  • speakingEval     │        │
│           │             └──────────────────────┘        │
│           ▼                                              │
│  ┌─────────────────┐    ┌──────────────────────┐        │
│  │  ContextManager  │──→│  Few-Shot Examples   │        │
│  │  (Adds examples  │    │  • Admin-created     │        │
│  │   to prompts)    │    │  • Curated content   │        │
│  └─────────────────┘    └──────────────────────┘        │
│                                                          │
└─────────────────────────────────────────────────────────┘
```

### AI Service Layer (Backend)

Each AI feature has a dedicated service that handles its specific logic:

```
backend/src/services/ai/
│
├── LessonAIService.js       → Generates structured lessons (vocab, grammar, exercises)
├── QuizAIService.js          → Creates quizzes with various question types
├── ChatAIService.js          → Manages conversation context & memory
├── SpeakingAIService.js      → Analyzes pronunciation & fluency
├── ReadingAIService.js       → Generates passages + comprehension questions
├── WritingAIService.js       → Grades writing with detailed feedback
├── HearingAIService.js       → Generates listening exercises + TTS
└── VocabularyAIService.js    → Creates vocabulary lists with mnemonics
```

#### Example: LessonAIService.js

```javascript
class LessonAIService {
  async generateLesson({ topic, level, skillArea, duration }) {
    const prompt = this.promptBuilder.build('lessonGeneration', {
      topic,
      level,        // A1, A2, B1, B2, C1
      skillArea,    // reading, writing, speaking, hearing
      duration,     // 15, 30, 45, 60 minutes
      numVocabulary: 10,
      numGrammarPoints: 3,
      includeExercises: true,
    });
    
    // Include admin-provided few-shot examples
    const examples = await this.getFewShotExamples('lessons', level);
    prompt.addExamples(examples);
    
    const response = await this.providerManager.call('GEMINI', prompt);
    return this.parseLessonResponse(response);
  }
}
```

---

## 🎓 Admin Training System

### How "Training" Works (No Fine-Tuning Needed)

Instead of expensive model fine-tuning, the system uses **Prompt Engineering + Few-Shot Learning** — which is free and can be updated instantly from the admin panel.

### Training Architecture

```
┌─────────────────────────────────────────────────────────┐
│              ADMIN TRAINING SYSTEM                       │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  Admin Panel                     AI Engine               │
│  ┌────────────────┐           ┌──────────────────┐      │
│  │ Prompt Editor  │───Edit───▶│ Prompt Templates │      │
│  └────────────────┘           │ (stored in DB)   │      │
│                                └──────────────────┘      │
│  ┌────────────────┐           ┌──────────────────┐      │
│  │ Upload Content │───Save───▶│ Few-Shot Examples│      │
│  │ (lessons, etc) │           │ (stored in DB)   │      │
│  └────────────────┘           └──────────────────┘      │
│                                ┌──────────────────┐      │
│  ┌────────────────┐           │ AI Generation    │      │
│  │ Preview Output │◀───Render─│ (with examples   │      │
│  └────────────────┘           │  as context)     │      │
│                                └──────────────────┘      │
└─────────────────────────────────────────────────────────┘
```

### Admin Training Dashboard Features

#### 1. Lesson Generator
- Set topic, level (A1–C1), duration, skill focus
- Upload **example lessons** as training data
- AI generates lessons matching your style
- Preview, edit, and publish directly

#### 2. Exam/Quiz Generator
- Configure question types (multiple choice, fill-in-blank, matching)
- Set difficulty distribution
- Upload past exams as training examples
- Generate complete exams with answer keys

#### 3. Vocabulary Manager
- Upload word lists (CSV/JSON)
- AI generates example sentences, mnemonics, audio pronunciations
- Organize by topic, level, frequency

#### 4. Speaking Scorer
- Configure evaluation criteria (pronunciation, fluency, intonation)
- Upload sample recordings with scores as training data
- AI evaluates student recordings against your standards

#### 5. Reading Sets
- Create reading passages or have AI generate them
- Add comprehension questions
- Set vocabulary targets based on passage content

#### 6. Writing Prompts
- Define essay/prompt types
- Set grading rubric (grammar, vocabulary, structure, coherence)
- Upload graded examples to train the AI evaluator

#### 7. Hearing Exercises
- Upload audio files or have AI generate text-to-speech
- Create listening comprehension questions
- Configure difficulty based on speech rate and vocabulary

#### 8. Prompt Templates
- The core of the training system
- Edit the actual prompts sent to the AI
- Tweak instructions, format requirements, tone
- Version-controlled — roll back if needed

### Example: Prompt Template in Admin Panel

```json
{
  "id": "lessonGeneration",
  "name": "Lesson Generation Template",
  "version": 3,
  "template": "You are a German {level} teacher. Create a lesson about {topic}.\n\nCONTENT GUIDELINES:\n- Include exactly {numVocabulary} new vocabulary words with example sentences\n- Include {numGrammarPoints} grammar explanations with examples\n- Difficulty level: {difficulty} (CEFR standard)\n- Focus skill area: {skillArea}\n- Lesson duration: {duration} minutes\n\nSTYLE GUIDELINES:\n- Use clear, simple language for explanations\n- Include real-world examples\n- Add cultural notes where relevant\n\nEXAMPLES OF GOOD LESSONS (for reference):\n{adminProvidedExamples}\n\nOUTPUT FORMAT:\nReturn valid JSON with keys: title, vocabulary[], grammar[], exercises[], summary",
  "variables": {
    "level": ["A1", "A2", "B1", "B2", "C1"],
    "skillArea": ["reading", "writing", "speaking", "hearing", "vocabulary", "grammar"],
    "numVocabulary": "number",
    "numGrammarPoints": "number",
    "duration": "number"
  },
  "lastEdited": "2026-05-28T10:30:00Z",
  "editedBy": "admin@example.com"
}
```

---

## 🗄 Database Schema (Prisma)

### Core Models

```prisma
model User {
  id            String   @id @default(uuid())
  email         String   @unique
  passwordHash  String
  name          String
  nativeLanguage String  @default("en")
  level         String   @default("A1") // A1, A2, B1, B2, C1
  role          String   @default("student") // student | admin | superadmin
  isActive      Boolean  @default(true)
  createdAt     DateTime @default(now())
  updatedAt     DateTime @updatedAt
  
  // Relations
  progress      UserProgress[]
  chatHistory   ChatHistory[]
  writingSubmissions WritingSubmission[]
}

model Admin {
  id            String   @id @default(uuid())
  email         String   @unique
  passwordHash  String
  name          String
  role          String   @default("admin") // admin | superadmin
  permissions   String[] // ["courses:create", "users:delete", "ai:train", ...]
  isActive      Boolean  @default(true)
  lastLogin     DateTime?
  createdAt     DateTime @default(now())
  updatedAt     DateTime @updatedAt
}

model Course {
  id          String   @id @default(uuid())
  title       String
  description String
  level       String   // A1, A2, B1, B2, C1
  imageUrl    String?
  isPublished Boolean  @default(false)
  order       Int
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
  
  // Relations
  lessons     Lesson[]
  enrollments Enrollment[]
}

model Lesson {
  id          String   @id @default(uuid())
  courseId     String
  title       String
  content     Json?    // Rich content structure
  level       String
  skillArea   String   // reading, writing, speaking, hearing, vocabulary, grammar
  duration    Int      // minutes
  order       Int
  isPublished Boolean  @default(false)
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
  
  // Relations
  course      Course   @relation(fields: [courseId], references: [id])
  exercises   Exercise[]
  quizzes     Quiz[]
}

model Exercise {
  id          String   @id @default(uuid())
  lessonId    String
  type        String   // fillBlank, multipleChoice, matching, dragDrop, writing
  question    Json     // Question content + options
  answer      Json     // Correct answer(s)
  explanation String?
  points      Int      @default(10)
  order       Int
  createdAt   DateTime @default(now())
  
  // Relations
  lesson      Lesson   @relation(fields: [lessonId], references: [id])
  submissions UserProgress[]
}

model Quiz {
  id          String   @id @default(uuid())
  lessonId    String
  title       String
  questions   Json     // Array of question objects
  passingScore Int     @default(70) // percentage
  timeLimit   Int?     // minutes
  createdAt   DateTime @default(now())
  
  // Relations
  lesson      Lesson   @relation(fields: [lessonId], references: [id])
  attempts    QuizAttempt[]
}

model UserProgress {
  id          String   @id @default(uuid())
  userId      String
  exerciseId  String?
  quizAttemptId String?
  score       Int?
  completed   Boolean  @default(false)
  answer      Json?    // User's answer
  aiFeedback  Json?    // AI-generated feedback
  createdAt   DateTime @default(now())
  
  // Relations
  user        User     @relation(fields: [userId], references: [id])
  exercise    Exercise? @relation(fields: [exerciseId], references: [id])
}

// NEW AI Training Models
model AITrainingData {
  id            String   @id @default(uuid())
  type          String   // lesson, quiz, vocabulary, writing, speaking, reading, hearing
  level         String   // A1-C1
  content       Json     // The training example content
  tags          String[] // ["vocabulary", "grammar", "past-tense"]
  createdBy     String   // Admin ID
  isActive      Boolean  @default(true)
  createdAt     DateTime @default(now())
  updatedAt     DateTime @updatedAt
}

model PromptTemplate {
  id            String   @id @default(uuid())
  name          String   @unique
  type          String   // lessonGeneration, quizGeneration, conversation, etc.
  template      String   // The prompt template with {variables}
  variables     Json     // Variable definitions
  version       Int      @default(1)
  isActive      Boolean  @default(true)
  lastEditedBy  String
  createdAt     DateTime @default(now())
  updatedAt     DateTime @updatedAt
}

model AIUsageLog {
  id            String   @id @default(uuid())
  userId        String?
  adminId       String?
  provider      String   // gemini, groq, openrouter, etc.
  model         String
  taskType      String   // generate-lesson, evaluate-answer, chat, etc.
  promptTokens  Int?
  outputTokens  Int?
  duration      Int      // ms
  success       Boolean
  errorMessage  String?
  cost          Float?   // in USD
  createdAt     DateTime @default(now())
}

model AdminLog {
  id          String   @id @default(uuid())
  adminId     String
  action      String   // create, update, delete, login, etc.
  resource    String   // course, lesson, user, settings, etc.
  resourceId  String?
  details     Json?
  ipAddress   String?
  createdAt   DateTime @default(now())
}
```

---

## 🚀 Deployment Guide

### Development Setup (Free)

```bash
# 1. Clone the repository
git clone https://github.com/yourusername/german-learning-app.git
cd german-learning-app

# 2. Backend setup
cd backend
cp .env.example .env
# Edit .env with your API keys
npm install
npx prisma migrate dev
npm run dev

# 3. Frontend setup
cd ../frontend
npm install
npm run dev

# 4. Admin panel setup
cd ../admin
npm install
npm run dev

# 5. AI Engine setup
cd ../ai-engine
cp .env.example .env
npm install
```

### Environment Variables (.env)

```bash
# Database
DATABASE_URL="postgresql://user:password@host:5432/germanapp"
SUPABASE_URL="https://your-project.supabase.co"
SUPABASE_ANON_KEY="your-supabase-anon-key"

# AI Providers
GEMINI_API_KEY="your-gemini-api-key"
GROQ_API_KEY="your-groq-api-key"
OPENROUTER_API_KEY="your-openrouter-api-key"
SAMBANOVA_API_KEY="your-sambanova-api-key"
CEREBRAS_API_KEY="your-cerebras-api-key"

# Auth
JWT_SECRET="your-jwt-secret"
JWT_EXPIRES_IN="7d"

# Media (Free tier)
CLOUDINARY_CLOUD_NAME="your-cloud-name"
CLOUDINARY_API_KEY="your-api-key"
CLOUDINARY_API_SECRET="your-api-secret"

# Email (Free: SendGrid or Resend)
EMAIL_API_KEY="your-email-api-key"

# App
NODE_ENV="development"
FRONTEND_URL="http://localhost:5173"
ADMIN_URL="http://localhost:5174"
PORT=5000
```

### Render Deployment (render.yaml)

```yaml
services:
  - type: web
    name: german-learning-backend
    env: node
    buildCommand: cd backend && npm install && npx prisma generate
    startCommand: cd backend && npm start
    envVars:
      - key: NODE_ENV
        value: production
      - key: DATABASE_URL
        fromDatabase:
          name: german-learning-db
          property: connectionString
      - key: GEMINI_API_KEY
        sync: false
      - key: JWT_SECRET
        generateValue: true

  - type: web
    name: german-learning-frontend
    env: static
    buildCommand: cd frontend && npm install && npm run build
    staticPublishPath: ./frontend/dist
    routes:
      - type: rewrite
        source: /*
        destination: /index.html

  - type: web
    name: german-learning-admin
    env: static
    buildCommand: cd admin && npm install && npm run build
    staticPublishPath: ./admin/dist
    routes:
      - type: rewrite
        source: /*
        destination: /index.html

databases:
  - name: german-learning-db
    databaseName: germanapp
    plan: free # Upgrade to starter ($7/mo) when going to production
```

### VPS + Coolify Production Setup

```dockerfile
# Dockerfile (for Coolify)
FROM node:20-alpine AS backend
WORKDIR /app
COPY backend/package*.json ./
RUN npm ci --only=production
COPY backend/ .
RUN npx prisma generate
EXPOSE 5000
CMD ["node", "src/index.js"]

FROM node:20-alpine AS frontend
WORKDIR /app
COPY frontend/package*.json ./
RUN npm ci
COPY frontend/ .
RUN npm run build

FROM node:20-alpine AS admin
WORKDIR /app
COPY admin/package*.json ./
RUN npm ci
COPY admin/ .
RUN npm run build

FROM nginx:alpine
COPY --from=frontend /app/dist /usr/share/nginx/html/student
COPY --from=admin /app/dist /usr/share/nginx/html/admin
COPY nginx.conf /etc/nginx/nginx.conf
```

```yaml
# docker-compose.yml (for Coolify)
version: '3.8'

services:
  postgres:
    image: postgres:16-alpine
    environment:
      POSTGRES_DB: germanapp
      POSTGRES_USER: germanapp
      POSTGRES_PASSWORD: ${DB_PASSWORD}
    volumes:
      - postgres_data:/var/lib/postgresql/data
    restart: always

  backend:
    build:
      context: .
      target: backend
    environment:
      DATABASE_URL: postgresql://germanapp:${DB_PASSWORD}@postgres:5432/germanapp
      GEMINI_API_KEY: ${GEMINI_API_KEY}
      GROQ_API_KEY: ${GROQ_API_KEY}
      OPENROUTER_API_KEY: ${OPENROUTER_API_KEY}
      JWT_SECRET: ${JWT_SECRET}
      NODE_ENV: production
    depends_on:
      - postgres
    restart: always

  frontend:
    build:
      context: .
      target: frontend
    ports:
      - "80:80"
    depends_on:
      - backend
    restart: always

volumes:
  postgres_data:
```

---

## 🎯 Development Roadmap

### Phase 1: Foundation (Weeks 1–2)
- [ ] Set up project scaffolding with the full directory structure
- [ ] Configure Supabase (free PostgreSQL + Auth)
- [ ] Build Express server with Prisma
- [ ] Implement student authentication (JWT)
- [ ] Create basic frontend with routing + navigation
- [ ] Deploy to Render free tier

### Phase 2: Core Features (Weeks 3–5)
- [ ] Build course CRUD
- [ ] Build lesson player
- [ ] Build exercise system (multiple types)
- [ ] Build quiz system with scoring
- [ ] Build progress tracking
- [ ] Build student dashboard

### Phase 3: Admin Panel (Weeks 6–8)
- [ ] Build admin authentication (separate from students)
- [ ] Build content management (courses, lessons, exercises, quizzes)
- [ ] Build user management
- [ ] Build media library
- [ ] Build analytics dashboard
- [ ] Build settings pages

### Phase 4: AI Integration (Weeks 9–12)
- [ ] Build AI Engine (provider router, prompt builder, fallback)
- [ ] Integrate Google Gemini API
- [ ] Integrate Groq API (real-time chat)
- [ ] Build AI lesson generator
- [ ] Build AI quiz generator
- [ ] Build AI conversation tutor
- [ ] Build AI writing evaluator
- [ ] Build AI speaking feedback

### Phase 5: Admin AI Training (Weeks 13–14)
- [ ] Build prompt template editor
- [ ] Build few-shot example uploader
- [ ] Build content preview system
- [ ] Build training dashboard
- [ ] Build AI usage analytics

### Phase 6: Production (Weeks 15–16)
- [ ] Set up VPS (Hetzner CX22)
- [ ] Install Coolify and configure
- [ ] Set up Docker Compose for all services
- [ ] Configure automatic SSL
- [ ] Migrate from Supabase to self-hosted PostgreSQL
- [ ] Set up CI/CD pipeline
- [ ] Performance optimization
- [ ] Load testing

---

## 📊 Cost Breakdown

### Development (Free Tier)
| Item | Cost |
|---|---|
| Render (Frontend + Backend) | $0 |
| Supabase (PostgreSQL + Auth) | $0 |
| Google Gemini API | $0 |
| Groq API | $0 |
| OpenRouter API | $0 |
| Cloudinary (Media) | $0 |
| **Total** | **$0/month** |

### Production (VPS + Coolify)
| Item | Cost |
|---|---|
| Hetzner VPS (CX22) | ~€4.99/month |
| Domain name | ~$10/year |
| DeepSeek V4 API (~500K tokens/day) | ~$5-20/month |
| **Total** | **~$10-25/month** |

### Scaling Costs
| Users/Month | VPS Needed | AI Cost | Total |
|---|---|---|---|
| 0–1,000 | CX22 (€5) | $5 | ~$10/mo |
| 1,000–5,000 | CX32 (€8) | $20 | ~$28/mo |
| 5,000–20,000 | CX42 (€14) | $80 | ~$94/mo |

---

## 🔑 Key Principles

1. **Start free, scale paid** — Build everything on free tiers first
2. **API stacking** — Use multiple free AI providers, not one
3. **No fine-tuning** — Use prompt engineering + few-shot learning (free, instant updates)
4. **Containerized from day 1** — Docker makes Render → Coolify migration seamless
5. **Admin is the product** — The admin training dashboard is your competitive advantage
6. **Data portable** — PostgreSQL everywhere, no vendor lock-in

---

> **Next Steps:** Pick a phase from the roadmap above and start building! The architecture is designed to be built incrementally — you can launch with basic features and add AI capabilities later.
