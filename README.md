![Instagram Clone](Gemini_Generated_Image_a9rzo2a9rzo2a9rz.png)

# Instagram Clone – Full Social Media App  
### Built with Flutter, Firebase, and Modern Social Media Architecture  
### Developed by **Ahmed Aljbry**

This project is a fully functional **Instagram Clone**, built from scratch using **Flutter** and **Firebase**, designed to replicate the core features of Instagram including posts, likes, comments, stories, reels, chat, notifications, profile management, and more.

The goal of this project is to demonstrate complete front-end + back-end integration using Google Firebase and modern mobile app architecture.

---

## 🚀 Features (Complete Social Media System)

### 🔐 Authentication
- Firebase Authentication (Email / Password / Phone)
- Secure user sessions
- Reset password & account recovery

### 🏠 Feed & Explore
- Home feed with real-time updates
- Explore page with recommended posts
- Infinite scroll + cached images

### 📸 Posts System
- Upload photo or video posts
- Add captions, hashtags, mentions
- Like / Unlike posts
- Comment system with real-time updates
- Save posts for later
- Post details screen
- Real-time Firestore post syncing

### 🎥 Reels (Short Videos)
- Vertical video player (TikTok style)
- Auto-play next video
- Like, comment, share reels

### 📚 Stories
- Story viewer with progress animation
- Upload stories (image/video)
- 24-hour expiry (Firebase timestamp-based)
- Story indicators for users
- Story page with sequential viewing

### 💬 Direct Messages (Chat)
- Real-time chat using Firestore
- Single chat screen
- Seen / delivered indicators
- Send:
  - Text messages
  - Images
  - Emojis
- Online/offline status (Firebase presence)

### 🔔 Notifications
- Push notifications (FCM)
- In-app notifications (likes, follows, comments, messages)

### 👤 Profile
- Edit profile  
- Profile picture update  
- Bio, username, website  
- Grid of user posts  
- Tagged posts section  
- Followers / Following system  
- Follow / Unfollow  
- User discovery  

### 🔍 Search
- Search by username  
- Recommended users  
- Search history (local storage)  

---

## 🧱 Project Architecture

The app uses **Clean Architecture + Feature-Based Structure**:

```txt
lib/
  core/
    config/
    constants/
    utils/
    services/      # Firebase, Auth, Storage, Firestore
  features/
    auth/
    feed/
    posts/
    stories/
    reels/
    chat/
    profile/
    search/
    notifications/
  main.dart
  app.dart
