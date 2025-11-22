# Flutter + Laravel Login System

A simple and clean authentication system built with **Flutter** as the frontend and **Laravel** as the backend.  
This project implements user login using secure API communication, following modern mobile development and backend best practices.

---

## 🚀 Features

- User authentication (login)
- API communication using Laravel backend
- Secure token-based authentication (Laravel Sanctum or JWT, depending on setup)
- Validation of email and password
- Error handling and user feedback
- Clean and organized Flutter UI
- Modular code structure for easy maintenance

---

## 🛠️ Technologies Used

### **Frontend (Flutter)**
- Flutter SDK
- Dart
- HTTP package (API requests)
- Provider / Riverpod / GetX (depending on your implementation)
- Visual Studio Code

### **Backend (Laravel)**
- Laravel Framework
- Laravel Sanctum (or JWT Authentication)
- MySQL database
- RESTful API routes
- PHP 8+

---

## 📂 Project Structure (Flutter)

lib/
├─ screens/
│ └─ login_screen.dart
├─ services/
│ └─ auth_service.dart
├─ models/
├─ widgets/
└─ main.dart

---

## 🔌 API Endpoints (Laravel)

| Method | Endpoint      | Description        |
|--------|--------------|--------------------|
| POST   | `/login`     | Authenticates user |
| POST   | `/logout`    | Revokes token      |
| GET    | `/user`      | Returns user data  |

---

## ⚙️ Setup Instructions

### **Backend (Laravel)**

1. Clone the repository:
   ```bash
   git clone <repo-url>
Install dependencies:

composer install


Configure .env file and database connection:

cp .env.example .env
php artisan key:generate


Run migrations:

php artisan migrate


Start the server:

php artisan serve

Frontend (Flutter)

Navigate to the Flutter folder:

cd flutter_app/


Install dependencies:

flutter pub get


Run the app:

flutter run

🔒 Authentication Flow

User enters email and password

Flutter sends POST request to Laravel backend

Backend validates credentials

Backend returns user info + token

Token is stored securely in Flutter

User is redirected to the home screen

🧪 Error Handling

Invalid credentials

Network errors

Backend validation errors

Unexpected server responses

Each error displays a clear message to the user.

📄 License

This project is for educational and practical development purposes.
Feel free to modify and improve it as needed.

👤 Author

Anthonny Cerdas

GitHub: https://github.com/Makotojk

LinkedIn: https://www.linkedin.com/in/anthonny-cerdas-697529232
