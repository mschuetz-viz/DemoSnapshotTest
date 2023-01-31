# DemoSnapshotTest

Demo project demonstrating that a snapshot test that is supposed to fail will pass on Github Actions - when using `perceptualPrecision`. The Xcode project contains a out-of-the box SwiftUI app. The only changes done were:

- adding https://github.com/pointfreeco/swift-snapshot-testing as dependency to the unit test target
- added an asset catalog, having one single image, to the unit test target
- created two unit tests
  - `testImageMatchingReference` should always succeed, the image will match the recorded reference
  - `testImageNotMatchingReference` should always fail, the reference image was manually modified after recording.
- created the Github Actions workflow to run build & test after push to `main`



## Expected Behavior
- `testImageMatchingReference` should always succeed
- `testImageNotMatchingReference` should always fail

## Observed Behavior 
- `testImageMatchingReference` succeed locally, as well as on Github Actions
- `testImageNotMatchingReference` fails locally, but succeeds on Github Actions



