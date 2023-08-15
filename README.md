# Huda_Clinic_Mobile

# Project Description

The HUDA mobile application is a Dart based Android and iOS application that assists patients that use the HUDA clinic in a variety of ways that
streamline the many tedious processes patients typically have to go through such as:

- Registering for Athena
- Creating/Requesting appointments from the patient side
- Checking into appointments
- Canceling Appointment
- Viewing medical history
- Viewing diagnoses and prescriptions

Some of the technologies that we used in the application are:

- Android Studio
- Visual Studio Code
- Flutter framework
- AthenaOne API
- Emailjs API
- Firebase Authentication API
- Firebase Realtime database
- Gradle

Some of the challenges that we faced during the development process were:

- Not having widget access to the Athena API
- API Services communications delays
- Unexpected Website Re-Development
- Only 2 total app developers

# How to install and Run the project

1.  Install the lastest version of Flutter following the instructions on their website here: https://docs.flutter.dev/get-started/install
2.  The following applications are required for flutter development:
    1. Android Studio
    2. Microsoft Visual Studio
    3. Microsoft Visual Studio Code
    4. NOTE: Xcode is required to download for concurrent iOS development
3.  Clone the project via the GitHub reponsitory
4.  Open a terminal window:
    1.  run command to generate localizations: flutter gen l10n
    2.  run command to download dependencies: flutter pub get
5.  flutter pub get will add the following dependencies to the project's pubspec.yaml file:
        
                {
                     dependencies:
                     flutter:
                     sdk: flutter
                     firebase_core: ^2.4.1
                     firebase_auth: ^4.2.5
                     cloud_firestore: ^4.4.3

                     # The following adds the Cupertino Icons font to your application.
                     # Use with the CupertinoIcons class for iOS style icons.
                    cupertino_icons: ^1.0.2
                    firebase_database: ^10.0.9
                     fluttertoast: ^8.1.2
                     http: ^0.13.5
                     page_transition: ^2.0.9
                     flutter_email_sender: ^5.2.0
                    gap: ^2.0.1
                    url_launcher: ^6.1.10
                    flutter_phone_direct_caller: ^2.1.1
                    maps_launcher: ^2.2.0
                    syncfusion_flutter_signaturepad: ^20.4.53
                    intl: any
                    flutter_localizations:
                        sdk: flutter
                    flutter_web_auth: ^0.5.0
                    google_fonts: ^4.0.3
                    provider: ^6.0.5
                    step_progress_indicator: ^1.0.2
                    in_app_webview: ^0.0.9
                    flutter_inappwebview: ^5.7.2+3
                    mockito: ^5.4.0
                }

# How to use the Project

1. Set up an emulator for the desired mobile operating systems
2. Select desired emulation device in bottom right corner of the IDE
3. Click 'run' then 'start debugging' to begin application process

# Accounts for testing

1. Email submission sender:
   1. Email Address: HUDA.Clinic.Register@gmail.com
   2. Password: Cap$tone2023!
2. AthenaOne Login:
   1. Email Address: phrtest_preview@mailinator.com
   2. Password: Password1
