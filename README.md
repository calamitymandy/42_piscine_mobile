# 42_piscine_mobile

## Module 0

### ex00

flutter create ex00 — this is the standard Flutter command that generates a new project with all the boilerplate files (pubspec.yaml, lib/main.dart, platform folders, etc.) inside a folder called ex00.

We Replace the generated lib/main.dart with the actual ex00 solution — a simple page with a
centered text widget and a button that prints "Button pressed" to the debug console when clicked.

The subject says "create a new ex00 project using the tools provided by the framework" — flutter create is exactly that tool. Then you write your code inside lib/main.dart, which is the app's entry point.

Rebuilding the iOS configuration:
  
  cd /Users/amandine/Desktop/CODE/_42/42_piscine_mobile/mobileModule00/ex00
  flutter clean
  flutter pub get
  flutter create . --platforms ios
  flutter build ios --no-codesign
  
  Then open Xcode again:
  
  open ios/Runner.xcworkspace
  
  And re-set the bundle identifier to com.amande.ex00 in Signing & Capabilities as before. 
  In Xcode:
  1. Click on Runner in the left sidebar
  2. Go to the Signing & Capabilities tab

  ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Show it on a web browser:                                                                       
 
• run:
  
  flutter run -d chrome


### ex01