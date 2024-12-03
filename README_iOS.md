## Run App in iOS Emulator
Follow these steps to run your Flutter app on an iOS Simulator using Android Studio:

### 1. Install Required Tools on macOS
- Ensure that you are using **macOS**, as iOS development is only supported on macOS.
- Install **[Xcode](https://developer.apple.com/xcode/)** from the Mac App Store.

### 2. Set Up Xcode
- Open **Xcode** after installation.
- Go to **Preferences > Locations** and ensure a valid Command Line Tools version is selected.
- Accept the Xcode license by running the following command in the terminal:
  ```bash
  sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
  sudo xcodebuild -runFirstLaunch
  ```

### 3. Enable iOS Development in Flutter
- Ensure you have the latest version of Flutter installed.
- Run the following command to check your environment:
  ```bash
  flutter doctor
  ```
- Ensure all items under **iOS toolchain - develop for iOS devices** are green (e.g., Xcode, CocoaPods).

- If **CocoaPods** is not installed, install it with:
  ```bash
  sudo gem install cocoapods
  pod setup
  ```

### 4. Open an iOS Simulator
- Launch the iOS Simulator via Terminal:
  ```bash
  open -a Simulator
  ```
- Alternatively, open it from **Xcode > Open Developer Tool > Simulator**.

### 5. Select the iOS Simulator in Android Studio
- Open your Flutter project in **Android Studio**.
- Open the **Device Selection** menu in the top toolbar.
- Select the running iOS Simulator (e.g., iPhone 14).

### 6. Run the App
- In **Android Studio**, click on the **Run** button or use the following command in the terminal:
  ```bash
  flutter run
  ```
- The app will build and launch on the selected iOS Simulator.



## Publish App to Apple App Store (TestFlight)

Follow these steps to publish your Flutter app to **TestFlight** for testing on iOS devices:

### 1. Create an Apple Developer Account
- Go to the [Apple Developer Program](https://developer.apple.com/programs/) and sign up.
- The annual fee for an Apple Developer account is $99.
- After signing up, log in to the [Apple Developer Console](https://developer.apple.com/).

### 2. Prepare Your App for Release
- In your Flutter project, build the iOS release version of the app:
  ```bash
  flutter build ios --release
  ```
- Open the project in Xcode:
  ```bash
  open ios/Runner.xcworkspace
  ```

### 3. Set Up Your App in Xcode
- Go to **Xcode > Preferences** and make sure you are signed in with your Apple Developer account.
- In **Xcode**, select the **Runner** project, go to the **Signing & Capabilities** tab, and make sure your Apple ID is selected for the **Team**.
- Set the **Bundle Identifier** to a unique identifier, e.g., `com.company.newsapp`.
- Set the **Version** and **Build** number appropriately.
- iOS Device and Xcode Developer Account should be with same user login id.

### 4. Archive the App
- In **Xcode**, go to **Product > Archive** to create an archived version of the app.
- After archiving, the **Organizer** window will open. Select the archived build and click **Distribute App**.

### 5. Upload to App Store Connect
- In the **Organizer**, select **App Store Connect** and follow the prompts to upload your app to **App Store Connect**.
- After successful upload, go to [App Store Connect](https://appstoreconnect.apple.com/).

### 6. Configure TestFlight for Testing
- In **App Store Connect**, select your app and navigate to the **TestFlight** tab.
- Under the **iOS** section, click **+** to add a new tester.
- You can add testers via their email addresses or by sharing a public link.
- Once the app is available for testing, testers will receive an email invite to install the app via **TestFlight**.


### 7. Share the TestFlight Link
- Once your app is uploaded and reviewed by Apple (if required), you can share the **TestFlight** link with testers.
- Testers will install the app via **TestFlight** and can provide feedback.

### 8. Review and Make Changes
- Based on tester feedback, you may need to make updates to your app. After making changes, repeat the steps for uploading the new build to TestFlight for further testing.


