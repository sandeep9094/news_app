# Introduction
- Simple News App Feed using [NewsApi](https://newsapi.org/)


##  Project Prerequisites
-   [Flutter Installation](https://docs.flutter.dev/get-started/install)
-   [Android Studio](https://developer.android.com/studio)
-   [XCode](https://developer.apple.com/xcode/)

## Installation and Setup

Follow these steps to set up the project on your local machine:

1. **Download and Extract the Project**
   - Download the project ZIP file.
   - Unzip the file to your desired location.

2. **Open the Project in Android Studio**
   - Open **Android Studio**.
   - Go to **File > Open** and select the extracted project folder.

3. **Enable USB Debugging on Your Android Device**
   - Go to **Settings** on your Android device.
   - Scroll down and tap on **About phone**.
   - Tap **Build number** 7 times to enable **Developer options**.
   - Go back to **Settings** and open **Developer options**.
   - Toggle the switch to enable **USB debugging**.
   - Optionally, enable **Install via USB** if you want to install apps via USB without confirming on the device.

4. **Connect Your Android Device to the Computer**
   - Use a USB cable to connect your Android device to your computer.
   - Ensure your device is detected by running the following command in your terminal:
     ```bash
     flutter devices
     ```
   - You should see your physical device listed.

5. **Run Build Runner Command**
   - Open the **Terminal** in Android Studio.
   - Navigate to the project folder path (if not already there) and run the following command:
     ```bash
     dart run build_runner build
     ```
   - This command will generate code, such as JSON serialization or other build-related tasks.

6. **Run the App**
   - Once the build is successful, click on the **Run** button in Android Studio or use the terminal:
     ```bash
     flutter run
     ```
   - The app will launch on your connected device.

