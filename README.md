# 🧪 Rick & Morty Flutter App

A clean, production-ready Flutter test project that displays characters from the **Rick and Morty** universe using the public [Rick and Morty API](https://rickandmortyapi.com/documentation).  
The app includes pagination, local caching (offline mode), and favorites management — all implemented with **BLoC architecture** and **Hive** local database.

---

## 🚀 Features

### 🧍 Characters List
- Displays characters in card view.
- Each card shows:
  - Image  
  - Name  
  - Status (Alive / Dead / Unknown)  
  - Species  
  - Last known location  
- Includes pagination — loads new pages when scrolled to the bottom.

### ⭐ Favorites
- Add or remove any character from favorites.
- View all saved favorites in a dedicated screen.
- Sort favorites by:
  - Name
  - Status
- Favorites are stored locally using **Hive** and remain available offline.

### 🌓 Offline & Theming
- Offline caching of fetched characters.
- Dark / Light theme with automatic system detection.
- Smooth UX and clean UI following Flutter best practices.

---

## 🏗️ Architecture

The app follows a **Clean Architecture + BLoC Pattern**:


lib/
├── core/
│ └── theme/ → App theme (light/dark)
│
├── data/
│ ├── models/ → Data models (Character)
│ ├── repositories/ → Business logic / data management
│ └── services/ → API & Local storage layers
│
├── presentation/
│ ├── home/ → Characters listing (UI + Bloc)
│ ├── favorites/ → Favorites screen (UI + Bloc)
│ └── main/ → Navigation (BottomNavigationBar)
│
└── main.dart → Entry point


---

## 🧩 Technologies Used

| Purpose | Library |
|----------|----------|
| State Management | `flutter_bloc` |
| Networking | `http` |
| Local Database | `hive` + `hive_flutter` |
| Equatable Models | `equatable` |
| Offline Caching | `hive` |
| Pagination | Custom scroll listener |
| Images | `cached_network_image` |

---

## 🛠️ Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/<your-username>/flutter_rick_and_morty.git
   cd flutter_rick_and_morty
