# Flutter Signup Form Quest

## Project Overview

This project is a Flutter signup application developed using Dart. The application allows users to enter their name, email address, password, and confirm password. It validates the information entered by the user and displays a personalized welcome screen after successful validation.

The application also includes a Local Signup Coach that provides preset signup tips. This feature runs completely on the device without connecting to an external AI service or server.

**Student Name:** Greena Nisheethkumar Patel  
**Panther ID:** 002986028
**Track:** Graduate  
**Selected Tasks:** Task A — Local AI Signup Coach Simulation and Task C — Confirm & Celebrate  
**Framework:** Flutter  
**Programming Language:** Dart

## Features Implemented

### 1. Signup Form and Validation

The signup form contains four input fields:

- Full Name
- Email Address
- Password
- Confirm Password

The application checks whether the required fields are empty, validates the email format, and requires a password containing at least six characters.

The confirm-password field checks whether both passwords match. If any validation fails, an error message appears below the corresponding field.

### 2. Task A — Local AI Signup Coach Simulation

The Local Signup Coach provides preset signup tips stored directly in the application.

The feature includes:

- A Get a signup tip button.
- A loading indicator while retrieving a preset tip.
- A fixed local category called `password_help`.
- Sample tips about password safety.
- An error message when local tip data is unavailable.
- A Retry button to request another tip.
- A switch to simulate missing tip data for testing.

The tips are clearly labeled as preset demo content rather than live AI-generated responses.

The feature does not access the user's name, email address, or password. It also does not determine whether signup is successful.

### 3. Task C — Confirm & Celebrate

I added a Confirm Password field to verify that the user enters the same password twice.

If the passwords do not match, the application displays a validation error and prevents submission.

When all fields pass validation, the application navigates to a new screen displaying a personalized message such as:

**Welcome, Test User!**

This screen confirms that the demo form passed validation. No real account is created.

### 4. User Interface

The application uses Flutter Material Design widgets with a purple theme.

The interface includes outlined input fields, icons, validation messages, buttons, loading feedback, and a personalized welcome screen.

A scrollable layout is used to accommodate different screen sizes.

## Technologies Used

- Flutter
- Dart
- Visual Studio Code
- StatefulWidget
- Form and GlobalKey
- TextFormField and TextEditingController
- Navigator and MaterialPageRoute
- Material Design widgets

## Application Structure

The main implementation is located in:

`lib/main.dart`

The application contains three main widget classes:

**MyApp:** Configures the MaterialApp and application theme.

**SignupPage:** Manages the signup form, validation, input controllers, and local signup-tip feature.

**WelcomePage:** Displays the personalized welcome message after successful validation.

## Testing

The application was tested using a simulator.

| Test Case | Expected Result | Observed Result |
|---|---|---|
| Submit empty signup form | Required-field errors | Passed |
| Enter invalid email | Email validation error | Passed |
| Enter password shorter than six characters | Password length error | Passed |
| Submit valid starter form | Success SnackBar | Passed |
| Request local signup tip | Preset tip displayed | Passed |
| Simulate missing tip data | Local error message displayed | Passed |
| Disable missing-tip simulation and retry | Preset tip displayed again | Passed |
| Submit valid practice signup | Personalized welcome screen | Passed |
| Submit mismatched passwords | Submission blocked | Passed |

During testing, the application displayed the expected local-tip error and successfully recovered when the Retry button was used.

The mismatched-password test also confirmed that the form blocks submission when the password and confirm-password fields contain different values.

## Graduate Critical Thinking Questions

### Question 1: Identify one privacy boundary in the local tip feature. What information does it keep out of the feature, and why?

The Local Signup Coach does not use the user's name, email address, or password to select a tip. Instead, it uses a fixed category called `password_help` and retrieves a preset message stored in the application.

This separation helps protect personal information because the tip feature does not need access to sensitive form data. It also keeps the signup validation process independent from the coaching feature.

### Question 2: What should the UI do when local tip data is empty or missing? Explain your error and retry behavior.

When local tip data is unavailable, the application should display a clear error message instead of showing an empty result or crashing.

In this practice application, I included a switch that simulates missing tip data. When I enabled the switch and requested a tip, the application displayed "No local signup tip is available" along with a Retry button.

After disabling the switch and selecting Retry, the application displayed a preset tip again. This demonstrated that the feature could recover from a simulated local error.

### Question 3: Describe one trade-off in your local design and a practical improvement.

One trade-off in this application is that the signup tips are predefined rather than dynamically generated. This makes the feature predictable, easier to test, and independent of internet connectivity, but the available advice is limited.

A practical improvement would be to include more categories of preset tips, such as account safety and privacy guidance. I could also improve accessibility by providing clearer loading announcements and ensuring that error messages are easy to understand.

## Privacy and Responsible AI

The application does not connect to any live AI model, external server, or API.

All signup tips are stored locally and selected using a fixed category. Personal form information is not passed to the tip feature.

The preset tips provide general guidance only. They do not replace form validation or approve signup.

## Limitations

- The application does not create real user accounts.
- Signup information is not stored in a database.
- Password validation is basic and is not a guarantee of password security.
- The Local Signup Coach uses a limited collection of preset tips.
- The application does not use live AI or network requests.
- The simulated error feature is intended for testing and demonstration.

## How to Run the Application

### Requirements

- Flutter SDK
- Dart SDK
- Visual Studio Code or Android Studio
- A configured simulator, emulator, or physical device

### Steps

**1. Clone the repository**

```bash
git clone https://github.com/greena-19/signup_app.git
```

**2. Open the project**

```bash
cd signup_app
```

**3. Install dependencies**

```bash
flutter pub get
```

**4. Run the application**

```bash
flutter run
```

**5. Check for analysis issues**

```bash
flutter analyze
```

**6. Build the Android APK**

```bash
flutter build apk --release
```

The generated release APK is located at:

`build/app/outputs/flutter-apk/app-release.apk`

## Conclusion

This practice project helped me understand how Flutter forms, validation, state management, and navigation work together.

I practiced implementing a local signup-tip feature with loading, error, and retry states. I also explored how confirm-password validation and personalized navigation improve the signup experience.

The project demonstrates how to build a small interactive Flutter application while keeping personal information separate from optional guidance features.