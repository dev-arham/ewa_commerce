# EWA Commerce - Flutter E-commerce App

![Flutter](https://img.shields.io/badge/Flutter-3.7.0+-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0.0+-0175C2?logo=dart)
![GetX](https://img.shields.io/badge/GetX-4.6.6+-8A2BE2)
![License](https://img.shields.io/badge/License-MIT-green)

A modern, feature-rich e-commerce mobile application built with Flutter and GetX state management.


## ✨ Features

- **User Authentication**: Sign in, sign up, password reset, and Google authentication
- **Product Catalog**: Browse products with categories, search functionality
- **Shopping Experience**: Add to cart, wishlist management, product details
- **User Profile**: Settings, order tracking, saved addresses
- **Payment Integration**: Secure checkout with Stripe
- **Dark Mode**: Full support for light and dark themes
- **Responsive Design**: Works seamlessly across different device sizes
- **Offline Support**: Basic functionality in offline mode

## 🛠️ Tech Stack

- **Framework**: Flutter
- **State Management**: GetX
- **Storage**: Get Storage for local data persistence
- **UI Components**: Custom widgets, Shimmer effects, Carousel slider
- **Authentication**: Firebase, Google Sign-In
- **Networking**: HTTP package for API integration
- **Icons & Styling**: Iconsax, Google Fonts (Poppins)
- **Animations**: Lottie animations for enhanced UX

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.7.0)
- Dart SDK (^3.7.0)
- Android Studio / VS Code
- Git

### Installation

1. Clone the repository
```bash
git clone https://github.com/dev-arham/ewa_commerce.git
cd ewa_commerce
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## 🏗️ Project Structure

```
lib/
├── app.dart                  # App entry point with GetMaterialApp
├── bindings/                 # GetX dependency injection
├── common/                   # Shared widgets & components
├── data/                     # Data layer (repositories, models)
├── features/                 # Feature modules
│   ├── authentication/       # Auth related screens & controllers
│   ├── personalization/      # User profile & preferences
│   └── shop/                 # Main shopping features
├── navigation_menu.dart      # Bottom navigation handling
└── utils/                    # Utilities & helpers
    ├── constants/            # App constants (colors, sizes, etc.)
    ├── helpers/              # Helper functions
    ├── loaders/              # Loading components
    └── theme/                # App theme configuration
```

## 📚 Libraries & Dependencies

- **State Management**
  - get: ^4.6.6
  - get_storage: ^2.1.1

- **UI Components**
  - iconsax: ^0.0.8
  - carousel_slider: ^5.0.0
  - shimmer: ^3.0.0
  - flutter_rating_bar: ^4.0.1
  - smooth_page_indicator: ^1.1.0

- **Functionality**
  - http: ^1.3.0
  - image_picker: ^1.1.2
  - url_launcher: ^6.2.6
  - flutter_stripe: ^11.4.0

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📧 Contact

Arham Mustafa - [arhammustafa179@gmail.com](mailto:arhammustafa179@gmail.com)

Project Link: [https://github.com/dev-arham/ewa_commerce](https://github.com/dev-arham/ewa_commerce)
