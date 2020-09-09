# zeta

A modern, cross-platform [Zermelo](https://www.zermelo.nl/) app with some extra features, like notifications on a schedule-change. Built with [Flutter](https://flutter.dev/).

[GitHub Project Board](https://github.com/Netlob/zeta/projects/1)

![screenshots](https://media.discordapp.net/attachments/600450283423662082/702582680780275753/New_Project_5.png "Screenshots")

## Debug instructions
Make sure to install Flutter [(installation instructions)](https://flutter.dev/docs/get-started/install) and Xcode (for IOS).

```bash
flutter pub get
flutter run
```
When running/building for the iOS platform, you may need to run `pod install` inside the `ios/` folder after the `flutter pub get` commmand.

# note
This project uses `inject` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```

## Hide Generated Files

In-order to hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor` -> `File Types` and paste the below lines under `ignore files and folders` section:

```
*.inject.summary;*.inject.dart;*.g.dart;
```

In Visual Studio Code, navigate to `Preferences` -> `Settings` and search for `Files:Exclude`. Add the following patterns:
```
**/*.inject.summary
**/*.inject.dart
**/*.g.dart
```

-------
[GPL-3.0 license](https://github.com/Netlob/zeta/blob/master/LICENSE)
