# to_do_list_app

# Local Storage & State Management App 💾

This repository contains my implementation for the Week 2 Flutter Task. The core objective was to move from static user interfaces to dynamic data management, focusing on standard state handling and persistent local storage.

## 🧠 Engineering Approach & Problem Solving

During this task, I focused on solving data retention challenges and applying clean coding principles:

*   *Data Serialization (The SharedPreferences Constraint):* SharedPreferences only accepts primitive types (Strings, ints, etc.) and cannot store custom Dart objects directly. To solve this, I built a dedicated TaskModel with toMap() and fromMap() methods. I used jsonEncode and jsonDecode to serialize the task list into a JSON String list for persistent storage.
*   *Abstraction of Storage Logic (Scalability):* I avoided calling SharedPreferences directly inside the UI files. Instead, I encapsulated the storage behavior inside a centralized StorageService. This separates concerns cleanly, meaning if I decide to switch the database to Hive or SQLite in the future, the UI code remains completely untouched.
*   *Asynchronous Data Loading (Edge Case):* Since reading from local disk is asynchronous (Future), I managed the initial application state to securely fetch saved tasks upon startup before rendering the dynamic list, ensuring no layout popping occurs.
*   *UI Responsibility:* Kept widgets highly modular by creating a standalone TaskItem widget to render individual list elements, keeping the main TodoScreen concise and clean.

---

## 📂 Architecture & Directory Layout

I organized the project using a clean data-and-view separation pattern:

lib/
├── core/
│   └── services/
│       └── storage_service.dart # Handles JSON encoding/decoding & disk I/O
├── models/
│   └── task_model.dart          # Data structure & serialization factories
└── views/
    ├── counter/
    │   └── counter_screen.dart  # Basic setState counter implementation
    └── todo/
        ├── todo_screen.dart     # Dynamic Task List View
        └── widgets/
            └── task_item.dart   # Modular list tile component