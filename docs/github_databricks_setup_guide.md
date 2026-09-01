# GitHub + Databricks Git Setup Guide
### For a Team of 3 — Step-by-Step from Scratch

---

## Overview

| Phase | What happens |
|-------|-------------|
| **Phase 1** | Each person creates their own GitHub account |
| **Phase 2** | Person 1 (Team Lead) creates the shared repo and adds others as collaborators |
| **Phase 3** | Everyone clones the repo locally |
| **Phase 4** | Everyone connects the repo to their Databricks workspace via Git Folders |
| **Phase 5** | Day-to-day workflow — branching, committing, pushing |

---

## Phase 1 — Each Person Creates a GitHub Account

> All 3 team members do this independently on their own machines/emails.

### Step 1.1 — Sign Up
1. Open your browser and go to [https://github.com](https://github.com)
2. Click the **"Sign up"** button (top-right corner)
3. Enter your **email address** → Click **Continue**
4. Create a **password** (min 8 characters, must include a number or symbol) → Click **Continue**
5. Choose a **username** — this is your public identity on GitHub
   - Recommended convention for your team: `dhanush-lakehouse`, `person2-lakehouse`, `person3-lakehouse` (or simply your first names)
   - Username must be unique globally — GitHub will tell you if it's taken
6. Answer whether you want product updates → Click **Continue**
7. Solve the puzzle (bot verification) → Click **Create account**
8. GitHub sends a **verification code** to your email — enter it on the screen
9. On the "Tell us about yourself" screen — you can skip all of this by scrolling down and clicking **"Skip personalization"**
10. You are now on your GitHub Dashboard ✅

### Step 1.2 — Set Up Your Profile (Recommended)
1. Click your **profile picture / avatar** (top-right) → **"Your profile"**
2. Click **"Edit profile"**
3. Fill in:
   - Name: Your real name
   - Bio: e.g., `Data Engineering learner | Databricks`
4. Click **Save**

### Step 1.3 — Enable Two-Factor Authentication (Strongly Recommended)
1. Click your avatar (top-right) → **Settings**
2. Left sidebar → **Password and authentication**
3. Under "Two-factor authentication" → click **Enable**
4. Choose **Authenticator app** (use Google Authenticator or Authy on your phone)
5. Scan the QR code with the app → enter the 6-digit code shown → Click **Enable**
6. Save your **recovery codes** somewhere safe (download or copy them)

> All 3 people complete Phase 1 before moving to Phase 2.

---

## Phase 2 — Person 1 (Team Lead) Creates the Shared Repository

> Only **one person** does this — the designated team lead.

### Step 2.1 — Create the Repository
1. Log in to GitHub (as Person 1)
2. Click the **"+"** icon (top-right) → **"New repository"**
3. Fill in the form:
   - **Repository name:** `databricks-lakehouse-practice`
   - **Description:** `Team hands-on practice repo for Databricks Lakehouse — Data Ingestion, Delta, Pipelines`
   - **Visibility:** Select **Public** (free accounts get unlimited public repos; private also works on free tier)
   - ✅ Check **"Add a README file"**
   - **Add .gitignore:** Click the dropdown → search and select **"Python"**
   - **Choose a license:** Select **MIT License** (standard for practice repos)
4. Click **"Create repository"** ✅

### Step 2.2 — Set Up the Folder Structure Inside the Repo
1. On the repo page, click **"Add file"** → **"Create new file"**
2. In the filename box, type: `dev_person1/.gitkeep` (this creates the folder)
3. Scroll down → Click **"Commit new file"** (use default commit message)
4. Repeat for:
   - `dev_person2/.gitkeep`
   - `dev_person3/.gitkeep`
   - `data/raw/.gitkeep`
   - `data/processed/.gitkeep`
   - `notebooks/shared/.gitkeep`
   - `docs/.gitkeep`

Your repo structure will now look like:
```
databricks-lakehouse-practice/
├── dev_person1/          ← Person 1's personal workspace
├── dev_person2/          ← Person 2's personal workspace
├── dev_person3/          ← Person 3's personal workspace
├── data/
│   ├── raw/              ← Raw input datasets
│   └── processed/        ← Cleaned/transformed datasets
├── notebooks/
│   └── shared/           ← Notebooks everyone uses together
├── docs/                 ← Notes, diagrams, documentation
├── .gitignore
├── LICENSE
└── README.md
```

### Step 2.3 — Update the README
1. On the repo homepage, click **"README.md"** → click the **pencil icon** (Edit)
2. Replace the default content with:

```markdown
# Databricks Lakehouse Practice

Team hands-on practice repository for learning the full Databricks Lakehouse workflow.

## Topics Covered
- Data Ingestion (Week 1–2)
- Data Validation (Week 3)
- Data Transformation (Week 4)
- Delta Tables (Week 5)
- Data Quality Checks (Week 6)
- Data Analysis (Week 7)
- Dashboarding (Week 8)

## Team Workspace Layout
| Folder | Owner |
|--------|-------|
| `/dev_person1` | Person 1 |
| `/dev_person2` | Person 2 |
| `/dev_person3` | Person 3 |
| `/notebooks/shared` | All team members |
| `/data` | Shared datasets |
| `/docs` | Notes and documentation |

## Setup
See `docs/setup_guide.md` for full setup instructions.
```

3. Click **"Commit changes"** → **"Commit directly to the main branch"** → **Commit changes**

### Step 2.4 — Add Person 2 and Person 3 as Collaborators
1. On the repo page → click **"Settings"** tab (top menu)
2. Left sidebar → **"Collaborators"** (under "Access")
3. Click **"Add people"**
4. Type Person 2's **GitHub username** → select them → Click **"Add [username] to this repository"**
5. Repeat for Person 3
6. GitHub sends an **email invitation** to Person 2 and Person 3

### Step 2.5 — Person 2 and Person 3 Accept the Invitation
1. Each person checks their **email** for a message from GitHub with subject: `[Person1] invited you to collaborate on...`
2. Click the **"View invitation"** button in the email
3. On the GitHub page that opens → Click **"Accept invitation"** ✅

> All 3 people now have write access to the shared repo.

---

## Phase 3 — Everyone Clones the Repository Locally

> All 3 team members do this on their own machines.

### Step 3.1 — Install Git (if not already installed)

**Windows:**
1. Go to [https://git-scm.com/download/win](https://git-scm.com/download/win)
2. Download and run the installer
3. Accept all defaults during installation
4. After install, open **Git Bash** (search for it in Start Menu)
5. Verify: type `git --version` → should show something like `git version 2.x.x`

**Mac:**
1. Open **Terminal**
2. Type `git --version`
3. If not installed, macOS will prompt you to install Xcode Command Line Tools → Click Install
4. After install: `git --version` should work

**Linux (Ubuntu/Debian):**
```bash
sudo apt update
sudo apt install git -y
git --version
```

### Step 3.2 — Configure Git with Your Identity
Open Git Bash (Windows) or Terminal (Mac/Linux) and run:

```bash
git config --global user.name "Your Full Name"
git config --global user.email "youremail@example.com"
```

Use the **same email** you used to create your GitHub account.

Verify:
```bash
git config --list
# Should show your name and email
```

### Step 3.3 — Authenticate GitHub on Your Machine

**Option A — GitHub CLI (Recommended, easiest)**
1. Download GitHub CLI from [https://cli.github.com](https://cli.github.com)
2. Install it (follow the installer)
3. Open terminal and run:
```bash
gh auth login
```
4. Choose:
   - **GitHub.com**
   - **HTTPS**
   - **Yes** (authenticate Git with GitHub credentials)
   - **Login with a web browser**
5. Copy the one-time code shown → Press Enter → browser opens → paste the code → Authorize

**Option B — Personal Access Token (if you don't want CLI)**
1. On GitHub → Click your avatar → **Settings**
2. Left sidebar (scroll to bottom) → **Developer settings**
3. **Personal access tokens** → **Tokens (classic)** → **Generate new token (classic)**
4. Name it: `local-machine-access`
5. Expiration: **90 days** (or No expiration for practice)
6. Check these scopes: ✅ `repo`, ✅ `workflow`, ✅ `read:org`
7. Click **Generate token** → **Copy the token immediately** (you won't see it again)
8. Store it in a safe place (e.g., a password manager)
9. When Git asks for a password during clone/push — use this token instead of your GitHub password

### Step 3.4 — Clone the Repository
```bash
# Navigate to where you want to store the project (e.g., Desktop or Documents)
cd ~/Documents

# Clone the repo (replace YOUR_PERSON1_USERNAME with actual username)
git clone https://github.com/YOUR_PERSON1_USERNAME/databricks-lakehouse-practice.git

# Go into the folder
cd databricks-lakehouse-practice

# Verify everything is there
ls -la
```

You should see all the folders: `dev_person1`, `dev_person2`, `dev_person3`, `data`, `notebooks`, `docs`, etc.

---

## Phase 4 — Connect the Repo to Databricks Workspace via Git Folders

> All 3 people do this inside their own Databricks workspace.

### Step 4.1 — Generate a GitHub Personal Access Token (for Databricks)

> Even if you did Option A (CLI) earlier, Databricks needs a token specifically.

1. Go to GitHub → Your avatar → **Settings**
2. Left sidebar (scroll to bottom) → **Developer settings**
3. **Personal access tokens** → **Tokens (classic)** → **Generate new token (classic)**
4. Name it: `databricks-git-integration`
5. Expiration: **90 days**
6. Check these scopes: ✅ `repo` (this gives full repo read/write access)
7. Click **Generate token** → **Copy it immediately** and save it somewhere safe

### Step 4.2 — Add GitHub Credentials to Your Databricks Workspace
1. Log in to your Databricks workspace: [https://dbc-f5fdc83d-7ce2.cloud.databricks.com](https://dbc-f5fdc83d-7ce2.cloud.databricks.com)
2. Click your **username/email** (top-right corner) → **"User Settings"**
3. In the left sidebar → click **"Linked accounts"** (or "Git integration" depending on your version)
4. Under "Git provider" → select **GitHub**
5. Fill in:
   - **Git provider username:** Your GitHub username
   - **Token:** Paste the Personal Access Token you just generated
6. Click **Save** ✅

### Step 4.3 — Create a Git Folder (Repo Link) in Databricks

> Each person creates a Git Folder that points to their own folder in the shared repo.

1. In the Databricks left sidebar → click **"Workspace"**
2. Navigate to your personal folder: `/Users/youremail@domain.com/`
3. Click the **"⋮" (three dots)** next to your folder → **"Create"** → **"Git folder"**
   - (Alternatively: Click **"+ New"** at the top → **"Git folder"**)
4. Fill in the dialog:
   - **Git repository URL:** `https://github.com/YOUR_PERSON1_USERNAME/databricks-lakehouse-practice.git`
   - **Git provider:** GitHub
   - **Git folder name:** `databricks-lakehouse-practice`
5. Click **"Create Git folder"** ✅

Your Databricks workspace now shows the full repo structure. You can open notebooks directly from it.

### Step 4.4 — Working Inside Your Personal Dev Folder in Databricks

Inside the Git folder in Databricks, navigate to your personal folder:
- Person 1 → works inside `dev_person1/`
- Person 2 → works inside `dev_person2/`
- Person 3 → works inside `dev_person3/`

To create a notebook in your folder:
1. Click on your `dev_personX` folder
2. Click **"+ New"** → **"Notebook"**
3. Give it a name (e.g., `week1_data_ingestion_csv`)
4. Choose language: **Python**
5. Click **"Create"**

---

## Phase 5 — Day-to-Day Git Workflow for the Team

### The Golden Rule: Never commit directly to `main`

Everyone works on their **own branch**, then merges via Pull Request.

### Creating a Branch for Each Week's Work

**In Databricks (via the Git Folder UI):**
1. Open your Git folder in the Workspace
2. Click the **branch name** shown at the top (usually `main`)
3. Click **"Create branch"**
4. Name it: `week1-ingestion-person1` (use your own name and topic)
5. Click **"Create"**

**OR from your local terminal:**
```bash
cd databricks-lakehouse-practice

# Pull latest changes first
git pull origin main

# Create and switch to your branch
git checkout -b week1-ingestion-person1

# Verify you're on the new branch
git branch
```

### Saving and Committing Work

**From local terminal:**
```bash
# See what files changed
git status

# Stage your changes (add all files in your dev folder)
git add dev_person1/

# Commit with a clear message
git commit -m "Week 1: CSV ingestion notebook with autoloader demo"

# Push to GitHub
git push origin week1-ingestion-person1
```

**From Databricks Git Folder UI:**
1. Click the **branch name** at the top of the Git Folder
2. Click **"Commit & Push"**
3. Check the boxes next to changed files
4. Write a commit message
5. Click **"Commit & Push"** ✅

### Creating a Pull Request (to merge your work into main)
1. Go to GitHub → your repo page
2. You'll see a yellow banner: **"week1-ingestion-person1 had recent pushes"** → Click **"Compare & pull request"**
3. Fill in:
   - **Title:** `Week 1 - Person 1: CSV Ingestion with Autoloader`
   - **Description:** Brief explanation of what you did and any notes for reviewers
4. Assign a **reviewer** (one of the other team members)
5. Click **"Create pull request"**

### Reviewing and Merging a PR
1. The assigned reviewer goes to the repo → **"Pull requests"** tab
2. Opens the PR → Reviews the changes tab
3. Clicks **"Review changes"** → Selects **"Approve"** → Submits
4. The PR author (or reviewer) clicks **"Merge pull request"** → **"Confirm merge"**
5. Delete the branch after merging (GitHub shows a button for this)

### Keeping Your Local Copy Updated
```bash
# Switch back to main
git checkout main

# Pull the latest merged changes
git pull origin main
```

---

## Quick Reference Card — Commands Everyone Should Know

```bash
# Daily start: update your local copy
git pull origin main

# Create your week's branch
git checkout -b weekN-topic-yourname

# Check what's changed
git status

# Stage and commit
git add dev_personX/
git commit -m "Brief description of what you did"

# Push to GitHub
git push origin weekN-topic-yourname

# Switch between branches
git checkout main
git checkout weekN-topic-yourname

# View commit history
git log --oneline
```

---

## Summary Checklist

### Person 1 (Team Lead)
- [ ] Create GitHub account
- [ ] Create repo `databricks-lakehouse-practice` with README + .gitignore
- [ ] Create folder structure (dev_person1, dev_person2, dev_person3, data, notebooks, docs)
- [ ] Add Person 2 and Person 3 as collaborators
- [ ] Install Git locally + configure name/email
- [ ] Clone the repo locally
- [ ] Generate GitHub PAT for Databricks
- [ ] Connect Git folder in Databricks workspace

### Person 2
- [ ] Create GitHub account
- [ ] Accept repo invitation from email
- [ ] Install Git locally + configure name/email
- [ ] Clone the repo locally
- [ ] Generate GitHub PAT for Databricks
- [ ] Connect Git folder in Databricks workspace

### Person 3
- [ ] Create GitHub account
- [ ] Accept repo invitation from email
- [ ] Install Git locally + configure name/email
- [ ] Clone the repo locally
- [ ] Generate GitHub PAT for Databricks
- [ ] Connect Git folder in Databricks workspace

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| `git push` asks for username/password | Use your GitHub username + PAT (not your GitHub password) |
| "Permission denied" when pushing | Make sure you accepted the collaborator invitation |
| Databricks Git folder shows "Authentication failed" | Re-generate your PAT in GitHub and update it in Databricks User Settings → Linked accounts |
| Branch not showing in Databricks | Click the branch dropdown and hit the refresh icon |
| Merge conflict | Pull `main` into your branch first: `git pull origin main` then resolve conflicts |
| `.gitignore` not ignoring `.pyc` files | Run `git rm -r --cached .` then `git add .` then commit |

---

*Guide Version: August 2026 — Databricks Free Edition + GitHub Free Tier*
