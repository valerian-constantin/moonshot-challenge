# 🚀 Moonshot

An iOS app that lets you explore NASA's Apollo missions and the astronauts who took part in them.

Built as part of the [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui) course by Paul Hudson — **Hacking with Swift**.

---

## 📱 Features

- Browse all Apollo missions in a **grid or list view**
- View mission details including launch date, highlights, and crew
- Tap any crew member to learn more about the astronaut
- Smooth **animated transitions** between grid and list
- Dark mode throughout

---

## 🛠 What I learned building this

- Loading and decoding **JSON from the app bundle** using `Codable`
- Writing a **generic `Bundle` extension** to decode any JSON type
- Working with **nested structs** and **dictionaries** in Swift
- Building layouts with `LazyVGrid` and `ScrollView`
- Extracting reusable **SwiftUI subviews**
- Animating view transitions with `withAnimation` and `.transition()`

---

## 📂 Project Structure

```
Moonshot/
├── Model/
│   ├── Astronaut.swift
│   └── Mission.swift
├── Views/
│   ├── ContentView.swift
│   ├── MissionView.swift
│   ├── AstronautView.swift
│   ├── GridPrincipal.swift
│   ├── GridSecundar.swift
│   └── DividerNou.swift
└── Extensions/
    └── Bundle-Decodable.swift
```

---

## ⚡️ Challenges completed

All three end-of-project challenges were completed:

1. ✅ Launch date displayed in `MissionView`
2. ✅ Reusable `DividerNou` view extracted, grid and list views separated into own files
3. ✅ Toolbar toggle between grid and list view — with animated transitions

---

## 🖼 Data & Images

Mission data and astronaut photos are sourced from NASA and are available under a public domain license (Title 17, Chapter 1, Section 105 of the US Code).

Astronaut descriptions sourced from Wikipedia, licensed under [CC-BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0).

---

## 👨‍💻 Built by

Valentin Constantin — iOS development learner, working through [Hacking with Swift](https://www.hackingwithswift.com).
