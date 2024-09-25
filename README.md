# test project

A new Flutter project.

#### Run
```bash

# For IOS
cd ios && -rm-rf Podfile.lock

#Reinstall the cocapods
pod install

# Run the app
flutter run
```

## Flutter Version
Flutter 3.19.2 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 7482962148 (7 months ago) • 2024-02-27 16:51:22 -0500
Engine • revision 04817c99c9
Tools • Dart 3.3.0 • DevTools 2.31.1

## Directory Structure
```
📂android
📂ios
📂lib
 │───main.dart  
 └───📂src
     └─── 📂config
     |    │────📂constants
     |    │────📂routers
     └────📂core
     |    │────📂controller
     |    │────📂service
     └────📂data
     |    │────📂datasources
     |    │────📂repositories
     └────📂domain
     |    │────📂datasources
     |    │────📂repositories
     |    │────📂entities
     └────📂presentations
     |    │────📂providers
     |    │────📂values
     |    │────📂views
     |    └────📂widgets

```

## Dependencies
Package Name        |
:-------------------------|
|[hooks_riverpod](https://pub.dev/packages/hooks_riverpod) 
|[flutter_hooks](https://pub.dev/packages/flutter_hooks)
|[go_router](https://pub.dev/packages/go_router)
|[flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage)
<br/>
