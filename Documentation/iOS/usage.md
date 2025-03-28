---
description: How to use  RC Contour SDK™ in your project.
---

# Usage
> [!TIP]
> Please make sure you have placed the license file as mentioned in the installation section.

## Using UI Kit

**Step 1.** Call following method to trigger RC Contour SDK™.

```Swift
func openContoursAISDK() {
     var configuration = Configuration()
     configuration.clientId = "<CLIENT ID>"
     configuration.token = "<TOEKN>"
     RCContour.initialize(configuration: configuration)
     let rcContourVC = RCContour.getLaunchScreen()
     let navigationController = UINavigationController(rootViewController: rcContourVC)
     navigationController.modalPresentationStyle = .fullScreen
     self.present(navigationController, animated: false)
}
```

> [!NOTE]
> * **token** - Need to provide token to authenticate the user.
> * **clientId** - clientId will be provided by your CSM along with the license key.

**Step 2.** Add **import RC_Contour_SDK** in the import section of the ViewController.

**Step 3.** Add following method in AppDelegate to support device orientation as Contour AI SDK™ will run only in landscape mode.

```Swift
import ContoursAI_SDK

func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    return ContoursAIFramework.shared.isLandscape ? .landscapeRight : .portrait
}
```

## Simulators
While it is possible to test your app with the RC Contour SDK™ on simulators, we strongly recommend using real iOS devices. Depending on the emulated camera you may not be able to test/evaluate the full functionality of the RC Contour SDK™.
