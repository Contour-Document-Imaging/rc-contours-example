---
description: How to use RC contour SDK.
---

# Usage

> [!TIP]
> Please make sure you have placed the license file as mentioned in the installation section.

**Step 1.** Call below method where you want to start RC Contour SDK™. 

```Kotlin
 private fun startContourSDK() {
    val contourModel = RCContourModel()
    contourModel.clientId = ""
    contourModel.token = ""

    RCContour.launchSdk(this, contourModel, object: IContourResultListener {
        override fun onSDKClosed() {

        }
    }) 
}
```

* **clientId** - clientId will be provided by your CSM along with the license key.
* **token** - Need to provide token to authenticate the user.

**Step 2.** Add following statements in the imports section.
```
import com.contourdocumentimaging.sdk.contour_rc.callbacks.IContourResultListener
import com.contourdocumentimaging.sdk.contour_rc.modules.RCContour
import com.contourdocumentimaging.sdk.contour_rc.modules.base.model.RCContourModel
```

**Step 3.** Since your application will work with high-resolution images it is strongly recommended to add the property ```android:largeHeap="true"``` in the ```<application>``` element of your AndroidManifest.xml file. Processing hi-res images is a memory intensive task and this property will ensure your app has enough heap allocated to avoid ```OutOfMemoryError``` exceptions.
```xml
<application android:largeHeap="true" ...>
    ...
</application>
```

### Emulators
While it is possible to test your app with the RC Contour SDK™ on emulators, we strongly recommend using real Android devices. Depending on the emulated camera you may not be able to test/evaluate the full functionality of the RC Contour SDK™.
