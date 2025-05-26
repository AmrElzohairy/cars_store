## 🚗 Car Store App

A modern Flutter application following **Clean Architecture**, with secure user authentication, REST API integration, and a beautiful UI to browse, like, and manage cars. The app is designed with **scalability**, **separation of concerns**, and **performance** in mind.

---

### 📱 Features

- 🔐 **Authentication**: Secure login via REST API.
- 🏁 **Splash Screen**: Native splash for quick startup.
- 🏠 **Home Screen**:
  - Shows **Featured Cars** and **Recommended Cars**.
  - Allows users to **Like/Unlike** cars.
- 🔍 **Search**: Easily search for cars by name or model.
- 🚘 **Car Details Screen**: View images, specifications, like status, and more about a selected car.
- ❤️ **Favorites Screen**: Displays a list of all liked cars.
- 👤 **Profile Screen**: Displays current user information.
- 🔒 **Secure Data Storage**: Tokens and sensitive data securely stored using `flutter_secure_storage`.
- ⚡ **Cached Data**: Non-sensitive data cached using `shared_preferences`.

---

### 🧭 Screens Overview

#### 🏠 Home Screen

**Sections:**
- **Featured Cars** – Premium or highlighted vehicles.
- **Recommended Cars** – Suggested based on user preferences or latest listings.

**Actions:**
- Like/Unlike any car with instant UI feedback.
- Tap to navigate to **Car Details**.
- Access **Search Bar** at the top to find cars quickly.

---

#### 🔍 Search Feature

- Realtime search bar to find cars by name or model.
- Works from the **Home Screen**.
- Results update as you type.
- Tapping a result navigates to its **Car Details**.

---

#### 🚘 Car Details Screen

**Shows:**
- Car images (main image or carousel).
- Car name, model, price, specs (e.g., engine, color, year).
- Like status (with toggle support).
- Option to go back or navigate to **Favorites**.

---

#### ❤️ Favorites Screen

- Displays all cars that the user has **liked**.
- Allows **unliking** cars directly from the list.
- Reflects real-time like/unlike state.

---

#### 👤 Profile Screen

- Shows basic user info (name, email, etc.).
- Future enhancements: edit profile, logout, etc.

---

#### 🏁 Splash Screen

- Uses [`flutter_native_splash`](https://pub.dev/packages/flutter_native_splash) for a seamless native startup experience.
- Automatically navigates to the appropriate screen based on login state.

---

### 🛠️ Tech Stack

| Category           | Tool/Package                                                                      |
|--------------------|------------------------------------------------------------------------------------|
| 🛰️ Networking       | [dio](https://pub.dev/packages/dio)                                                |
| 🔒 Secure Storage   | [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage)          |
| 💾 Local Caching    | [shared_preferences](https://pub.dev/packages/shared_preferences)                  |
| ⚙️ State Management | [Cubit](https://pub.dev/packages/flutter_bloc) / [Bloc](https://pub.dev/packages/flutter_bloc) |
| 🏁 Splash Screen    | [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)            |
| 🧱 Architecture     | Clean Architecture                                                                 |


### 📸 App Screenshots


<div align="center">

<img src="https://github.com/user-attachments/assets/b903780a-69c0-4aa9-8652-75f1c35574ce" width="200" height="400" />
<img src="https://github.com/user-attachments/assets/76f2fa0e-8488-4f11-85fe-79c65fab66b0" width="200" height="400" />
<img src="https://github.com/user-attachments/assets/366bc35c-b70f-44f8-9bd0-e4339979f853" width="200" height="400" />


<br />

<img src="https://github.com/user-attachments/assets/6593b037-d35b-4aa6-a23a-c4e18ecaf904" width="200" height="400" />
<img src="https://github.com/user-attachments/assets/d7ef3fa3-6528-4cd9-a705-7f1bc87a28b1" width="200" height="400" />
<img src="https://github.com/user-attachments/assets/b6938907-70d7-465c-b45f-c45ec78a9ce1" width="200" height="400" />


<br />

<img src="https://github.com/user-attachments/assets/7b5e9367-c688-4f4d-a569-f0bf8771daf4" width="200" height="400" />
<img src="https://github.com/user-attachments/assets/e514bc4b-cfd6-46c8-b21a-7f3ecbe72731" width="200" height="400" />
<img src="https://github.com/user-attachments/assets/e6d48fb5-7887-4c9d-a8e8-97c92ba28d9b" width="200" height="400" />

<br />

<img src="https://github.com/user-attachments/assets/33957ac3-6c17-458b-8683-2007f8c53d17" width="200" height="400" />

</div>









