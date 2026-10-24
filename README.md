# Anatolia Heritage: Digital Archaeological Guide 🏛️

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)

**Anatolia Heritage** is an information-centric Android mobile application designed to showcase 21 of Turkey's most significant archaeological sites (e.g., Ephesus, Troy, Göbeklitepe). Developed as a graduation project, it bridges the gap between academic depth and user experience, providing stratigraphic analyses and historical contexts in an offline-first environment.

## 📱 Features

* **Information-Centric Delivery:** Focuses on high-quality, academic content without the clutter of complex maps or navigation.
* **Offline First:** All data, images, and architectural analyses are bundled within the app, requiring no internet connection.
* **Stratigraphic Analysis:** Visualizes the historical layers (e.g., Troy's 9 layers, Ephesus's marine regression) using custom UI blocks.
* **Glossary-Linked Text:** Archaeological terms inside site descriptions are underlined; tapping one opens its definition from the built-in glossary.
* **Two-Way Timeline:** Tapping a period on the `HorizontalTimeline` scrolls to its content, and scrolling the content updates the selected period.
* **Dynamic Theme Engine:** Features **8 distinct color flavors** (e.g., *Soft Denim, Imperial Purple, Amber Forest*) based on the "60-30-10" color rule.
* **Bilingual Support:** Full English and Turkish support with instant language switching via `localization.dart` .
* **Custom Timeline:** An interactive `HorizontalTimeline` widget to navigate through historical periods .

## 🛠️ Technical Architecture

This project strictly adheres to **Clean Code** principles and avoids heavy third-party dependencies to demonstrate core Flutter proficiency. The single platform plugin in use is `shared_preferences`, which persists the user's theme, color flavor, language and favorites across restarts.

### 1. Native State Management

Instead of using external libraries like Bloc or Provider, a custom `AppStateProvider` was implemented using Flutter's **`InheritedWidget`**. This manages the global state (Theme, Locale, Favorites) efficiently and performantly .

### 2. Data Registry & Lazy Loading

To optimize memory usage, the app uses a **Lazy Loading** pattern defined in `site_registry.dart`. Detailed content for the 21 sites is not loaded at startup; instead, it is fetched only when the user navigates to a specific site .

### 3. Modular File Structure

The project is organized into clear layers (Data, Core, Screens, Widgets, State) to ensure scalability.

```
lib/
├── main.dart (App entry point & Theme Engine)
├── core/
│   ├── models.dart (Data Models: SiteData, AnalysisSection)
│   └── utils.dart (Helpers: Zoomable Image Viewer)
├── data/
│   ├── localization.dart (Static string maps for TR/EN)
│   ├── site_registry.dart (Lazy-loader registry)
│   ├── sites.dart (Site metadata for search)
│   └── sites/ (Individual content files for 21 sites)
├── screens/
│ ├── about_screen.dart (Project info & credits)
│ ├── favorites_screen.dart (User's saved sites)
│ ├── glossary_screen.dart (Archaeological dictionary)
│ ├── home_screen.dart (Main list & search view)
│ ├── settings_screen.dart (Theme & language settings)
│ ├── splash_screen.dart (App launch screen)
│ └── universal_site_screen.dart (Dynamic details page)
├── state/
│   └── state.dart (InheritedWidget Implementation)
└── widgets/
│ ├── app_clickable.dart (Interactive button wrapper)
│ ├── app_drawer.dart (Side navigation menu)
│ ├── site_widgets.dart (Reusable content blocks)
│ └── timeline.dart (Horizontal history timeline)

```

## 🌍 Supported Sites (21)

The application includes detailed stratigraphic data for the following UNESCO World Heritage sites and candidates:

* **Ephesus** (Marine Regression Analysis)
* **Troy** (9 Settlement Layers)
* **Göbeklitepe** (The World's Oldest Temple)
* **Pergamon, Hierapolis, Aphrodisias, Hattusa, Nemrut, Xanthos**
* **Miletus, Priene, Sagalassos, Side, Didyma, Sardis**
* **Kaunos, Myra, Laodicea, Termessos, Perge, Aspendos**
...

## 🚀 Getting Started

To run this project locally:

1. **Clone the repository:**
```bash
git clone https://github.com/yourusername/anatolia-heritage.git

```

2. **Install dependencies:**
```bash
flutter pub get

```

3. **Run the app:**
```bash
flutter run

```

4. **Build APK (Universal):**
```bash
flutter build apk --release

```

## 👥 Team

* **Özcan Orhan Demirci** - *Lead Developer & Architecture*
* **Berkay Gülbeyaz** - *Content Strategy & Research*

## ⚖️ License & Copyright

**© 2026 Özcan Orhan Demirci**

All rights reserved.

This project was developed as a graduation project for the **Bakircay University Management Information Systems** department.
The source code is published for **showcase and academic review purposes only**.
Unauthorized copying, modification, distribution, or commercial use of this software is strictly prohibited.

---

### 📚 References & Acknowledgments

* **Google. (2025). Android Studio Documentation. Android Developers.
* **Google LLC. (2025). Flutter Documentation: Build apps for any screen. Flutter.dev.
* **Google. (2025). Dart Programming Language Specification. dart.dev.
* **Google. (2024). Material Design 3. M3.material.io.
* **Schneider, C., Fuller, M. A., Valacich, J. S., & George, J. F. (2020). Information Systems Project Management: A Process Approach (2nd ed.). Prospect Press.
* **Republic of Turkey Ministry of Culture and Tourism. (2025). Archaeological Sites. GoTurkey. From: https://goturkiye.com/
* **Austrian Archaeological Institute (ÖAI). (2025). General Stratigraphic Analysis and Research. Austrian Academy of Sciences. From: https://www.oeaw.ac.at/en/oeai/home
* **German Archaeological Institute (DAI). (2025). Archaeological Excavations and Research in Turkey. From https://www.dainst.org/en/
