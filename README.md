
# E-Commerce App

An **E-Commerce** mobile application built with **Flutter**, **Node.js**, **Express**, and **MongoDB**. The app allows users to log in, view products, and interact with various features of an e-commerce platform. This project is designed to demonstrate state management using **Cubit** and **Provider** in Flutter.

## Table of Contents

- [Project Overview](#project-overview)
- [Tech Stack](#tech-stack)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Project Structure](#project-structure)
- [Learning Journey](#learning-journey)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

This project aims to build a simple yet scalable e-commerce mobile app using modern technologies like **Flutter**, **Node.js**, **Express**, and **MongoDB**. The app includes user authentication, product listings, and other e-commerce functionalities. 

**Day 2 Progress:**
- Implemented **Cubit** for state management and **Provider** for dependency injection.
- Developed a **User Login** system where users can log in securely and access their personalized content.

## Tech Stack

- **Frontend:**
  - Flutter
  - Dart
- **Backend:**
  - Node.js
  - Express
  - MongoDB
- **State Management:**
  - Cubit
  - Provider

## Features

- **User Authentication:**
  - User login using email and password.
  - Account creation and secure login system.
- **Product Listing (Future Implementation):**
  - Display products available in the store.
- **Cart and Checkout (Future Implementation):**
  - Add products to the cart and checkout.

## Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- [Flutter](https://flutter.dev/docs/get-started/install) for building mobile applications.
- [Node.js](https://nodejs.org/en/download/) for the backend server.
- [MongoDB](https://www.mongodb.com/try/download/community) for database management.

### Installation

Follow these steps to get your development environment set up and running:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/ecommerce-app.git
   cd ecommerce-app
   ```

2. **Set up the backend:**
   - Navigate to the backend folder:
     ```bash
     cd backend
     ```
   - Install backend dependencies:
     ```bash
     npm install
     ```
   - Start the server:
     ```bash
     npm start
     ```
   - Your backend API will be running on `http://localhost:8000/api`.

3. **Set up the Flutter app:**
   - Navigate to the Flutter project folder:
     ```bash
     cd flutter_app
     ```
   - Install Flutter dependencies:
     ```bash
     flutter pub get
     ```
   - Run the app:
     ```bash
     flutter run
     ```

4. **Access the app** in your emulator or on a connected device.

## Project Structure

The project is divided into two main parts:

- **Backend:**
  - Node.js and Express app handling API requests and interacting with MongoDB.
  - API endpoints for user authentication and account management.
  
- **Flutter App:**
  - User login functionality integrated with **Cubit** and **Provider**.
  - UI components for user login, including form validation and feedback.

## Learning Journey

**Day 2 Updates:**
- Learned and implemented **Cubit** for efficient state management, along with **Provider** for dependency injection.
- Successfully built and integrated the **User Login** functionality, enabling users to securely sign in.

## Contributing

Feel free to fork the repository and submit pull requests. If you encounter issues or have suggestions for improvements, please open an issue.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
