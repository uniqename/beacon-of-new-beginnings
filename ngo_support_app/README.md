# Beacon of New Beginnings - NGO Support App

> **Providing safety, healing, and empowerment to survivors of abuse and homelessness through comprehensive digital support services.**

## 🌟 Vision
A Ghana where every person, regardless of their past trauma or circumstances, has guaranteed access to safety, justice, and the resources needed to build a dignified, independent life free from violence and poverty.

## 📱 App Overview

Beacon of New Beginnings is a trauma-informed mobile application designed specifically for survivors of domestic violence, abuse, and homelessness in Ghana. The app provides immediate access to emergency services, resources, and community support while prioritizing user safety and privacy.

### Key Features

#### 🚨 Emergency Services
- **Anonymous Emergency Access** - Use critical features without registration
- **24/7 Crisis Hotlines** - Direct connection to domestic violence support
- **Location-Based Emergency Alerts** - Share location with emergency contacts and NGO staff
- **Emergency Case Management** - Automatic support case creation

#### 🏠 Resource Directory
- **Categorized Resources** - Shelter, Legal, Medical, Counseling, Employment, Financial
- **Location-Based Search** - Find nearby help with distance calculation
- **Real-Time Availability** - Live shelter capacity and service availability
- **Resource Booking** - Schedule appointments and request services
- **Verified Information** - Professional-verified resource listings

#### 🤝 Community Support
- **Support Groups** - Moderated groups for different healing journeys
- **Educational Resources** - Safety planning, trauma healing, financial independence
- **Success Stories** - Inspiring journeys of recovery and empowerment
- **Anonymous Participation** - Full privacy protection in all community features

### 🛡️ Privacy & Safety First

- **Anonymous Mode** - Use all features without creating an account
- **Encrypted Data** - All personal information protected with industry-standard encryption
- **Safe Design** - Trauma-informed UI/UX with calming colors and supportive messaging
- **Quick Exit** - Emergency exit features for unsafe situations

## 🏗️ Technical Architecture

### Technology Stack
- **Frontend**: Flutter (Cross-platform iOS/Android)
- **Backend**: Firebase (Authentication, Firestore, Cloud Functions, Messaging)
- **Maps**: Google Maps API for location services
- **Communication**: URL Launcher for phone/email integration
- **State Management**: Provider pattern
- **Security**: Firebase Security Rules, encrypted local storage

### Bundle IDs
- **Android**: `com.beaconnewbeginnings.ngo_support_app`
- **iOS**: `com.beaconnewbeginnings.ngo-support-app`

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (2.17.0 or higher)
- Android Studio / Xcode for device testing
- Firebase account for backend services

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-org/beacon-of-new-beginnings-app.git
   cd beacon-of-new-beginnings-app/ngo_support_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Create a new Firebase project: `ngo-support-app`
   - Enable Authentication, Firestore, Storage, and Messaging
   - Download configuration files:
     - `google-services.json` for Android
     - `GoogleService-Info.plist` for iOS
   - Update `lib/firebase_options.dart` with your project credentials

4. **Run the app**
   ```bash
   flutter run
   ```

## 📞 Emergency Contact Information

### Ghana Emergency Services
- **Emergency Hotline**: 999 (Police, Fire, Medical)
- **Domestic Violence Hotline**: 0800-800-800 (24/7 Support)
- **Beacon of New Beginnings Support**: +233-XXX-XXXX

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- Domestic violence survivors who shared their experiences to shape this app
- Mental health professionals who provided trauma-informed design guidance
- Legal advocates who helped define resource requirements

---

**"Your safety matters. Your story matters. You matter."**

*Beacon of New Beginnings - Empowering survivors, building futures.*
