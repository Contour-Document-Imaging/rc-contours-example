---
description: How to install RC Contour SDK™ on Android.
---

# Installation

## Requirements

### Android SDK
* The minimum supported Android SDK version is 21. 
* The target Android SDK version is 34. 

### Hardware
* Supported CPUs and [Architectures (ABIs)](https://developer.android.com/ndk/guides/arch.html): armeabi-v7a, arm64-v8a, x86, x86_64

## Steps to integrate RC Contour SDK™ using an AAR file
* You can find the latest version of RC Contour SDK™ AAR file from Github. Please make sure to periodically check for updates to the SDK. 
* Create a new folder in the **same directory** where your 'app' module is located and name it the same as your .aar for example ```'rc-contour-release'``` for ```'rc-contour-release.aar'```.
* Paste the ```rc-contour-release.aar``` file in that directory.
* Create a new file in the  ```rc-contour-release``` directory and name it ```build.gradle```
Enter the following lines of code in that file. 
```
configurations.maybeCreate("default")
artifacts.add("default", file('rc-contour-release.aar'))
```
* At the project level ``` settings.gradle``` file, change the line 
```
include ':app'
``` 
to:-
 ```
 include ':app' 
 include ':rc-contour-release'
 ```
* In the app module ```build.gradle``` file, add the following line in the **dependencies section**
```
implementation project(":rc-contour-release")
implementation 'com.github.Contour-Document-Imaging:contours-ai-android-sdk:1.10.5'
```
> [!TIP]
> If you prefer not to use Gradle for the Contour AI SDK™, you can also install it using the AAR file. Follow the steps below to add the Contour AI SDK™ as an AAR file.

## Steps to integrate Contour AI SDK™ using an AAR file

* You can find the latest version of the AAR file from [Github](https://github.com/Contour-Document-Imaging/contours-ai-example/releases). Please make sure to periodically check for updates to the SDK. 
* Create a new folder in the **same directory** where your 'app' module is located and name it the same as your .aar for example ```'contours-ai-release'``` for ```'contours-ai-release.aar'```.
* Paste the ```contours-ai-release.aar``` file in that directory.
* Create a new file in the  ```contours-ai-release``` directory and name it ```build.gradle```
Enter the following lines of code in that file. 
```
configurations.maybeCreate("default")
artifacts.add("default", file('contours-ai-release.aar'))
```
* At the project level ``` settings.gradle``` file, change the line 
```
include ':app'
``` 
to:-
 ```
 include ':app' 
 include ':contours-ai-release'
 ```
* In the app module ```build.gradle``` file, add the following line in the **dependencies section**
```
implementation project(":contours-ai-release")
implementation 'com.github.Contour-Document-Imaging:opencv4:v4.6.1'
```

#### The libraries have been successfully integrated. Now, it's time to implement the next set of changes.

* Open the settings.gradle file and add ```maven { url 'https://jitpack.io' }``` inside **repositories** or **allRepositories** section.
* Put license file in the ```app/src/main/assets/``` directory.
* Add these code block inside ```android { .. }``` in ```app/build.gradle``` like 
```groovy
packagingOptions {
    pickFirst '/lib/armeabi-v7a/libopencv_java4.so'
    pickFirst '/lib/arm64-v8a/libopencv_java4.so'
    pickFirst '/lib/x86/libopencv_java4.so'
    pickFirst '/lib/x86_64/libopencv_java4.so'
}
```
* If you get an error regarding *multidex* then 
    * open ```build.gradle``` of your app module and set ```multiDexEnabled``` as ```true``` inside ```defaultConfig {}```
    * add ```implementation "androidx.multidex:multidex:2.0.1"``` inside ```dependencies{}``` section of ```build.gradle``` file

* If you get an error like this
```
Manifest merger failed : Attribute application@allowBackup value=(true) from AndroidManifest.xml:6:9-35
is also present.
```
Then add ```tools:replace="android:allowBackup"``` under the application tag in ```AndroidManifest.xml```. Also add ``` xmlns:tools="http://schemas.android.com/tools"``` under the manifest tag if not added already.
> [!NOTE]
> Sync the project to resolve compile errors or restart Android Studio.

## Steps to install the license
* Place the licence file in ```app/src/main/assets```.
* The license file needs to have the name **contoursAI.license**. If the license file name does not match, it will lead to licensing errors.
* Make sure that your ApplicationId matches the ApplicationId that was provided while requesting the license file.

> [!NOTE]
> You will need to acquire a license file to successfully use the RC Contour SDK™. Please contact your CSM at Urban FT to get your license file. You will need to provide your ```ApplicationID``` when requesting the license file. 
