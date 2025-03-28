---
description: How to install RC Contour SDK™ on iOS.
---

# Installation

## Requirements

### Xcode
* We support Xcode 16 and above.
### iOS
* Minimum version of iOS supported is version 15.

## Steps to integrate RC Contour SDK™ using a XCFramework file
* Download the [RC Contour SDK™](https://github.com/Contour-Document-Imaging/rc-contours-example/releases) and [Contour AI SDK™](https://github.com/Contour-Document-Imaging/contours-ai-example/releases) XCFramework files from Github. Please make sure to periodically check for updates to the SDK.
* Copy the framework files and paste it in the project folder.
* Click on the Build Phase option and Link Binary with libraries. Click on + Sign -> Add other option -> Add File. Select the ```RCContourSDK.xcframework``` and ```ContoursAI_SDK.xcframework``` in the project folder and click open.
* Now you will see ```RCContourSDK.xcframework``` and ```ContoursAI_SDK.xcframework``` is added to your frameworks folder.
* Click on Project File and navigate to  ```General->Frameworks, Libraries, and Embedded Content```. Set the value for ```Embed``` to  **Embed & Sign** *ONLY* for ```RCContourSDK.xcframework``` and ```ContoursAI_SDK.xcframework```. 
* You can now build the project.

## Simulator support
* If you are facing any issue related to arm64 while running the app in the simulator, then exclude arm64 architecture for simulator in build settings. Add ```arm64``` in the ```Excluded Architectures``` section. Please refer below screenshot.

<!-- ![Exclude arm64 support](/img/arm64.png "Exclude arm64 support") -->

> [!NOTE]
> If you are facing issue in running the app on simulator then add below code in your pod file.
```
post_install do |installer|      
installer.pods_project.build_configurations.each do |config|        
        config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"      
    end
end
```

## Steps to install the license
* Place the licence file anywhere within the Project Bundle.
* The license file needs to have the name **contoursAI.license**. If the license file name does not match, it will lead to licensing errors.
* Make sure that your BundleIdentifier matches the BundleIdentifier that was provided while requesting the license file.

> [!NOTE]
> You will need to acquire a license file to successfully use the RC Contour SDK™. Please contact your CSM at Urban FT to get your license file. You will need to provide your ```BundleIdentifier``` when requesting the license file.

> [!TIP]
> Please make sure that RC Contour SDK™ is signed with team ID ```A77YYNYWPS```  
