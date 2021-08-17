<p align="center">
<img src="https://github.com/Grrravity/akt_token/blob/ffeb338dd6421a666936f7feb3ccae6a5c88548a/assets/png/logo_akt.png" height="100" alt="AktToken" />
</p>

---
# AktToken

AktToken is a flutter project to show how great it is to build cross plateforme apps.

## Architechture
This project use ResoCoder's **[Clean Architecture](https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/)**
The goal of this architecture is to make it easier for large-scale project to add or modify features as they work independantly and are easy to inject into the project.

###In this project:
-> Core folder contains global utility class or functions like
  Checking internet connection
  Handeling errors & exceptions
  Usecases (to simplify testing and implementation)
  Theming...
-> Features/Data contains related files to handle data from a source
  Models convert raw json to a dart model
  Implementation of source (repository)
  Source
-> Features/domain contains related files to link data source with business logic
  Entities are the data models
  Repository 
  Usecases (to simplify testing and implementation)
-> Features/Views contains UI files as long as their respective blocs for business logic
  blocs (business logic)
  Components contains reusable displays (several widgets that makes a whole element) and widgets (customized widget that may be used at several places)
  Screens contains the actual app screens

| Implementations      | status |
| :----------- | :----:  |
| iOS and Android support   | ✔️        |
| Web support   | ✔️        |
| Clean Architecture      | ✔️       |

## Android Installation *(require at least Flutter SDK)*

* Ensure your Android device has developer mode and usb debugging enabled

* Ensure your device is connected to your computer with usb 

1. Open in a terminal the targeted folder you wish to clone the project to

```bash
git clone https://github.com/Grrravity/akt_token.git
```

2. Get into the folder then install the apk on your phone

```bash
cd akt_token
flutter build apk
flutter install
```

## iOS Installation *(require at least Flutter SDK and XCode)*

* Ensure your iOS is connected and has given authorization to Xcode

1. Open in a terminal the targeted folder you wish to clone the project to in a terminal

```bash
git clone https://github.com/Grrravity/akt_token.git
```

2. Get into the folder then build the iOS app

```bash
cd akt_token
flutter build ios
```

3. Now in Xcode, open Runner.xcworkspace in your akt_token app's ios folder

4. Select your device in the list next to the runner and press Run icon


## Web Installation *(require at least Flutter SDK and Chrome)*

1. Open in a terminal the targeted folder you wish to clone the project to in a terminal

```bash
git clone https://github.com/Grrravity/akt_token.git
```

2. Get into the folder then build the web app

```bash
cd akt_token
flutter run -d chrome
```

This will open a localhost of this app in your chrome browser.

## APK Installation
* Check that your phone accept unknown source apk

1. Download the apk from TODO

2. Paste the apk in your Android's storage

4. Then open the apk from your Android file explorer, install it and launch it.
