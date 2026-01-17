# 🎬 Movie App Assignment (Flutter)

A Flutter application built as part of a Mobile Developer assignment.
The app fetches movies from the TMDB API and allows users to manage favourites and a watchlist.

---

## 📱 Features

- Splash Screen
- Bottom Navigation (Movies, Favourites, Watchlist)
- Browse popular movies from TMDB
- Search movies by title
- Add / remove movies from Favourites
- Add / remove movies from Watchlist
- Movie Details Screen:
  - Banner image
  - Overview
  - Release date
  - Rating (Circular progress)
  - Play Now (In-app notification)
- Loading, Empty & Error states
- Clean Material UI

---

## 🛠 Tech Stack

- **Flutter (Dart)**
- **State Management:** Provider
- **API:** TMDB
- **Networking:** Dio
- **Notifications:** flutter_local_notifications

---

## ⚙️ Setup Instructions

1. Clone the repository

```bash
git clone <your-repo-url>
cd movie_app_assignment
```

2. Add TMDB API key
   Edit:

```bash
lib/core/constants/api_constants.dart
```

3. Install dependencies

```bash
flutter pub get
```

4. Run the App

```bash
flutter run
```

📌 Assumptions

No authentication required

User data stored in memory

One device = one user

👨‍💻 Author

Kishan Agarwal
