# To-Do List App

A simple and minimal To-Do List application built using Flutter.

## 📌 Features
- Add new tasks with a title
- Mark tasks as completed using a checkbox
- Display a list of tasks with their status

## 🚀 Getting Started

### Prerequisites
- Flutter SDK **3.24.0**
- Dart **>=3.0.0**
- Android Studio / Visual Studio Code

### Installation
1. **Clone the repository**
   ```sh
   git clone https://github.com/YOUR_GITHUB_USERNAME/flutter_todo_app.git
   cd flutter_todo_app
   ```
2. **Install dependencies**
   ```sh
   flutter pub get
   ```
3. **Run the app**
   ```sh
   flutter run
   ```

## 🛠️ Technologies Used
- **Flutter 3.24.0**
- **Dart**
- **GetX** for state management
- **Flutter ScreenUtil** for responsive UI

## 📂 Project Structure
```
flutter_todo_app/
│── lib/
│   ├── main.dart         # Entry point of the app
│   ├── app/
│   │   ├── modules/
│   │   │   ├── home/
│   │   │   │   ├── views/home_view.dart  # Home screen UI
│   │   │   │   ├── controllers/home_controller.dart  # Home logic
│   │   │   │   ├── model/todo_model.dart  # Task model
│   │   ├── widgets/
│   │   │   ├── add_task.dart  # Add task bottom sheet
│   │   │   ├── todo_tile.dart  # Todo Tile Widget
│── pubspec.yaml  # Dependencies and assets
```

## 🔧 How to Contribute
1. Fork the repository
2. Create a new branch (`git checkout -b feature-branch`)
3. Commit your changes (`git commit -m 'Add new feature'`)
4. Push to the branch (`git push origin feature-branch`)
5. Open a Pull Request

## 📜 License
This project is open-source and available under the [MIT License](LICENSE).

