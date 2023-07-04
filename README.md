# Time Tracker Application

An application exclusively for Tora-tech employees to submit time shifts, apply for leaves etc.

## Requirements

```console
Install the latest version of Android Studio
Android studio installation instruction: https://developer.android.com/studio/install

Install the latest version of XCode
Xcode installation instruction: https://www.freecodecamp.org/news/how-to-download-and-install-xcode/

Install Flutter version >= 3.7.7 (Current)
Flutter installation instruction: https://docs.flutter.dev/get-started/install
```

## Installation

### Clone app from repository

```console
$ git clone https://github.com/DNQuyTD/study_app-android.git
```

### Get packages

```console
$ flutter pub get
```

## How to build

### Run

```console
$ flutter run
```

### Build

```console
$ flutter build <type>
```
with `<type>` is:

```console
aar               Build a repository containing an AAR and a POM file.
apk               Build an Android APK file from your app.
appbundle         Build an Android App Bundle file from your app.
bundle            Build the Flutter assets directory from your app.
ios               Build an iOS application bundle (macOS host only).
ios-framework     Produces .xcframeworks for a Flutter project and its plugins for integration into existing, plain iOS Xcode projects.
ipa               Build an iOS archive bundle and IPA for distribution (macOS host only).
macos             Build a macOS desktop application.
macos-framework   Produces .xcframeworks for a Flutter project and its plugins for integration into existing, plain macOS Xcode projects.
web               Build a web application bundle.
```

## How to generate file

### locale string

```console
$ flutter pub run easy_localization:generate -S assets/l10n -f keys -O lib/l10n -o locale_keys.g.dart
```
