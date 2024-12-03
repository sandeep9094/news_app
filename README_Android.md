## Run App in Android Physical/Emulator Device
Follow below steps to run in android device.


1. **Enable USB Debugging on Your Android Device**
    - Go to **Settings** on your Android device.
    - Scroll down and tap on **About phone**.
    - Tap **Build number** 7 times to enable **Developer options**.
    - Go back to **Settings** and open **Developer options**.
    - Toggle the switch to enable **USB debugging**.
    - Optionally, enable **Install via USB** if you want to install apps via USB without confirming on the device.

2. **Connect Your Android Device to the Computer**
    - Use a USB cable to connect your Android device to your computer.
    - Ensure your device is detected by running the following command in your terminal:
      ```bash
      flutter devices
      ```
    - You should see your physical device listed.

3. **Run App Via Terminal**
    - Once the build is successful, click on the **Run** button in Android Studio or use the terminal:
      ```bash
      flutter run
      ```
    - The app will launch on your connected device.
4. **Run App Via Android Studio**
    - You can also run app via select android device from Android Studio Flutter Device Selection and Run



## Publish App to Google Play Console

Follow these steps to publish your Flutter app to the **Google Play Store**:

### 1. Create a Google Play Developer Account
- Go to the [Google Play Console](https://play.google.com/console) and sign up.
- Pay the one-time registration fee of $25.
- Complete your account details.

### 2. Prepare Your App for Release
- In your Flutter project, run the following command to generate a release build:
  ```bash
  flutter build apk --release
  ```
  This will create a release APK in `build/app/outputs/flutter-apk/`.

- Alternatively, for an AAB (Android App Bundle), use:
  ```bash
  flutter build appbundle --release
  ```
  The AAB format is recommended for the Play Store.

### 3. Upload Your APK/AAB to Google Play Console
- Log in to the [Google Play Console](https://play.google.com/console).
- Select **Create Application** and fill in the required details (app name, description, etc.).
- Go to the **Release** section and click **Create Release**.
- Upload the generated APK or AAB file.
- Complete the remaining details like the app's content rating, privacy policy, and pricing.
- Click **Save** and then **Submit** for review.

### 4. Review and Publish
- After submission, the app will be reviewed by Google. If there are no issues, it will be published to the Google Play Store.
- You will receive an email notification once the app is live.
