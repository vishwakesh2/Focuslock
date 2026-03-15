# FocusLock

A focus-enforcing Android launcher built with Flutter.

## Features
- **Strike System**: Warns users before locking down
- **App Blocking**: Uses Accessibility Services to block restricted apps
- **Lockdown Mode**: Enforces a cooldown period after too many strikes
- **Custom Launcher**: Replaces the home screen with a focused interface

## Build

### Using Codemagic
1. Push this repo to GitHub
2. Connect to [codemagic.io](https://codemagic.io)
3. Build → Download APK

### Local Build
```bash
flutter pub get
flutter build apk --release
```

## Permissions Required
- **Accessibility Service**: To detect and block apps
- **Usage Stats**: To monitor app usage
- **System Alert Window**: For overlay when blocking
- **Query All Packages**: To list installed apps

## Setup
1. Install the APK
2. Grant all required permissions
3. Set as default launcher
4. Choose allowed apps and strike limits
5. Focus!
