# Findly

**Find, lost, sell — all in one place.**

Findly is a campus marketplace and lost & found app built for FAST-NUCES students. Post an item you've lost, report something you've found, or list something for sale — all backed by a real-time database with secure, university-email-only authentication.

Built with **Flutter** and **Supabase**.

---

## 📖 Table of Contents

- [About](#about)
- [Features](#features)
- [Screenshots](#screenshots)
- [Tech Stack](#tech-stack)
- [Installation (APK)](#installation-apk)
- [App Walkthrough](#app-walkthrough)
- [Architecture](#architecture)
- [Security](#security)
- [Known Limitations](#known-limitations)
- [Troubleshooting & Support](#troubleshooting--support)
- [Roadmap](#roadmap)
- [Tech Notes for Developers](#tech-notes-for-developers)
- [License](#license)
- [Contact](#contact)

---

## About

Findly was built to solve a real, everyday problem on campus: lost items rarely find their way back to their owners, and there's no easy way to sell or ask around for used items among students. Findly brings all three — **Lost**, **Found**, and **Sale** posts — into a single, simple feed, restricted to verified university email addresses only.

This project was built as a personal/portfolio project to learn and apply full-stack mobile development: real authentication, a real cloud database, cloud file storage, and proper access control — not just a local, offline demo app.

---

## Features

- 🔐 **Secure authentication** — signup/login restricted to `.nu.edu.pk` university emails, with email confirmation and password reset support
- 📱 **Lost & Found + Marketplace feed** — browse, filter by category (Lost / Found / Sale)
- 📸 **Image uploads** — attach photos to posts and profile pictures, stored in the cloud (not just locally on one device)
- 👁️ **View counter** — tracks unique views per post (each user's view only counts once)
- ✅ **Mark as Resolved / Sold** — post owners can mark their own item as resolved or sold
- 🧑‍💻 **Profile management** — edit name, profile photo, and see all posts you've made
- 🌗 **Dark mode** — full light/dark theme support across every screen
- 🔄 **Pull-to-refresh** — manually refresh the feed at any time
- 🔒 **Row-Level Security** — database-enforced rules ensure users can only edit or delete their own posts and profile, even if someone tried to bypass the app's UI
- 📶 **Graceful error handling** — friendly messages for network issues, instead of raw technical errors

---

## Screenshots

<p align="center">
  <img src="screenshots/feed.png" width="200" alt="Feed screen"/>
  <img src="screenshots/detail.png" width="200" alt="Post detail screen"/>
  <img src="screenshots/profile.png" width="200" alt="Profile screen"/>
  <img src="screenshots/dark-mode.png" width="200" alt="Dark mode"/>
</p>

> Replace the images above with your own — add a `screenshots/` folder to the repo root and drop your PNG/JPG files in with matching filenames (or update the paths above to match whatever you name them).

---

## Tech Stack

| Layer | Technology |
|---|---|
| Frontend | Flutter (Dart) |
| Backend / Database | Supabase (PostgreSQL) |
| Authentication | Supabase Auth (email/password, with confirmation & recovery) |
| File Storage | Supabase Storage (post images, profile pictures) |
| State Management | Provider |
| Local Caching | SharedPreferences |
| Fonts | Google Fonts |

---

## Installation (APK)

Findly isn't published on the Play Store — you can install it directly from the APK file in this repository's **Releases** section.

### Step-by-step

1. Go to the **[Releases](../../releases)** section of this repository (usually on the right-hand side of the repo's main page, or under the "Releases" tab).
2. Download the latest `.apk` file (e.g. `findly-release.apk`) to your Android phone.
3. Once downloaded, tap the file to open it.
4. Android will likely show a warning like **"Install blocked"** or **"For your security, your phone is not allowed to install unknown apps from this source."** This is normal — it's not a Play Store app, so Android flags it by default.
   - Tap **Settings** on that warning screen.
   - Enable **"Allow from this source"**.
   - Go back and tap **Install** again.
5. Once installed, open **Findly** from your app drawer like any other app.
6. **Sign up** using your university email (must end in `.nu.edu.pk`), then log in and start posting.

> **Note:** Android's "unknown sources" warning is standard for any app installed outside the Play Store — it does not mean the app is unsafe. This is expected behavior, not a red flag.

---

## App Walkthrough

- **Login / Signup** — university-email-restricted, with password reset via email
- **Feed** — scrollable grid of Lost, Found, and Sale posts, filterable by category
- **Post Detail** — full details, contact info, view count, and (for the poster) edit/resolve/delete actions
- **Create/Edit Post** — pick a photo, add a title, description, category, and price (for Sale posts)
- **Profile** — view/edit your name and photo, see all posts you've made, toggle dark mode

*(A short demo video is linked in this repo's description / LinkedIn post.)*

---

## Architecture

Findly uses a straightforward **Provider-based state management** pattern:

- `SettingProvider` — handles authentication (login, signup, logout, password reset), user profile data, and dark mode preference
- `PostProvider` — handles fetching, creating, updating, deleting, and filtering posts, plus view-count tracking

**Database tables (Supabase/PostgreSQL):**

| Table | Purpose |
|---|---|
| `posts` | All Lost/Found/Sale posts |
| `users` | Extended profile data (name, roll number, department, profile photo URL) — linked to Supabase's built-in `auth.users` |
| `post_views` | Tracks which users have viewed which posts, enforcing one unique view per user per post |

**Storage buckets:**

| Bucket | Purpose |
|---|---|
| `post-images` | Photos attached to Lost/Found/Sale posts |
| `profile-images` | User profile pictures |

Images are uploaded to Supabase Storage and referenced by their public URL — never stored as local device file paths — so content is visible correctly across any device, not just the one that created it.

---

## Security

- **Row-Level Security (RLS)** is enabled on all tables. Any logged-in user can *view* posts and public profile info (needed to display names/photos on posts), but can only **edit or delete their own** posts and profile — enforced at the database level, not just hidden in the UI.
- Passwords are handled entirely by Supabase Auth — never stored or transmitted in plain text by this app.
- The Supabase **anon key** included in the app is intentionally public-safe by design; real protection comes from the RLS policies described above, not from hiding this key.

---

## Known Limitations

- Currently Android-only (no iOS build)
- Supabase's free-tier email service has a low sending rate limit — confirmation/reset emails may occasionally be delayed under heavy testing
- Uploaded images are not automatically deleted from Storage when a post is deleted or a photo is replaced (minor storage housekeeping item, not a functional bug)
- Signup email domain validation is enforced in the app's UI; a determined user calling Supabase's API directly could bypass this — acceptable for the current scope of this project

---

## Troubleshooting & Support

If you run into any issues installing or using the app — crashes, login problems, missing images, or anything else — please reach out directly:

📧 **muhammadhassan.offi@gmail.com**

When reporting an issue, it helps to include:
- What you were trying to do
- Any error message you saw (a screenshot helps a lot)
- Your phone model / Android version, if relevant

---

## Roadmap

Ideas for future improvement, not yet implemented:

- In-app chat between buyer and seller
- Push notifications for new messages or matching lost/found items
- Search functionality across posts
- Automatic cleanup of orphaned images in Storage
- iOS support

---

## Tech Notes for Developers

If you'd like to run this project yourself:

1. Clone the repository
2. Run `flutter pub get`
3. Create your own [Supabase](https://supabase.com) project
4. Set up the `posts`, `users`, and `post_views` tables (see [Architecture](#architecture) above) along with matching Row-Level Security policies
5. Create `post-images` and `profile-images` Storage buckets (both public)
6. Add your Supabase project URL and anon key in `main.dart`
7. Run `flutter run`

> This app was built and tested primarily on Android via `flutter run` (debug) and `flutter build apk --release` (release builds).

---

## License

This project was built for educational/portfolio purposes. Feel free to explore the code and adapt ideas from it for your own learning.

---

## Contact

Built by **Muhammad Hassan** — BSCS student, FAST-NUCES.

📧 muhammadhassan.offi@gmail.com

If you're a recruiter, fellow student, or just curious about the project, feel free to reach out!
