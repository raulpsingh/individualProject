Smart alarm clock app

I want to create a smart alarm clock that can be turned off after solving tasks (solving simple examples, writing various phrases, etc.). The application will have user accounts with personal wake-up statistics and synchronization between devices with the same account.

Milestones:
1. Create main UI pages for login page, alarm list and alarm settings
2. Create database for storing accounts info
3. Create database for synchronizing alarms between devices
4. Write code for functionality
5. Connect databases

TechStak:
1. Coding language - Dart with flutter.
2. DataBases - FireBase FireStore and FireBase Auth.

Functionality:

For using the app you will need to create your account in it, account is used to synchronize alarms and statistics 
on all devices where app is used. After signing in you can add your first alarm. While adding new alarm you can choose
the mission you want to appear when you are stopping alarm. For now, there are two missions: Math mission(Solving math problems) 
and Writing mission(Re-writng phrases).
When alarm will start ringing it will send a notification andyou need to click it to open alarm page.After you stop the alarm
some statistics will be available in statistics tab. 
In settings you can change language of the app.

Instructions for build:

For building the app you will need Android emulator and flutter SDK.
Flutter sdk instructions: https://docs.flutter.dev/get-started/install
To launch android emulator in Android studio you need to open tools tab 
=> AVD manager => and create new emulator.

For Android Studio:
1. Open the project folder in Android studio.
2. Navigate to pubspec.yaml in root directory of project.
3. Cick on get all dependencies and upgrade dependencies.
4. Now you can run main.dart and it will work.
