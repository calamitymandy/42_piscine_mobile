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


Sur votre Mac, choisissez le menu Pomme  > Réglages Système, puis cliquez sur « Confidentialité et sécurité »  dans la barre latérale. Vous devrez peut-être faire défiler la page vers le bas.

Ouvrir les réglages « Confidentialité et sécurité »

Accédez à Sécurité, puis cliquez sur Ouvrir.

Cliquez sur « Ouvrir quand même ».

Ce bouton s’affiche pendant environ une heure après que vous avez essayé d’ouvrir l’app.

Saisissez votre mot de passe d’ouverture de session, puis cliquez sur OK.
  ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Show it on a web browser:                                                                       
 
• run:
  
  flutter run -d chrome


### ex01

The key Dart/Flutter concept:
  - StatelessWidget = never changes after being built
  - StatefulWidget = can change and rebuild when you call setState()

Convert HomePage to a StatefulWidget — this splits into two classes:
    - HomePage (the widget itself)
    - _HomePageState (holds the changing data)

Add a boolean variable _showHelloWorld to track which text to display
    - true → show "Hello World!"
    - false → show "A basic display"

Wrap the button's onPressed in setState() — this tells Flutter to
rebuild the UI when the variable changes

Toggle _showHelloWorld each time the button is clicked

Use a ternary operator to pick the right text: 
showHelloWorld ? "Hello World!" : "A basic display"
  
### ex02