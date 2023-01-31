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

## Output when running locally
```
Test Suite 'Selected tests' started at 2023-01-31 15:10:35.860
Test Suite 'DemoSnapshotTestTests.xctest' started at 2023-01-31 15:10:35.861
Test Suite 'DemoSnapshotTestTests' started at 2023-01-31 15:10:35.861
Test Case '-[DemoSnapshotTestTests.DemoSnapshotTestTests testImageMatchingReference]' started.
Test Case '-[DemoSnapshotTestTests.DemoSnapshotTestTests testImageMatchingReference]' passed (0.014 seconds).
Test Case '-[DemoSnapshotTestTests.DemoSnapshotTestTests testImageNotMatchingReference]' started.
/Users/meik.schuetz/Developer/viz/ios/temp/DemoSnapshotTest/DemoSnapshotTestTests/DemoSnapshotTestTests.swift:26: error: -[DemoSnapshotTestTests.DemoSnapshotTestTests testImageNotMatchingReference] : failed - Snapshot does not match reference.

@−
"file:///Users/meik.schuetz/Developer/viz/ios/temp/DemoSnapshotTest/DemoSnapshotTestTests/__Snapshots__/DemoSnapshotTestTests/testImageNotMatchingReference.1.png"
@+
"file:///Users/meik.schuetz/Library/Developer/CoreSimulator/Devices/2AEB7311-82EA-438E-8F42-1FAC0981876F/data/Containers/Data/Application/AE86FAE7-FB2E-4F34-9E6E-6F7FE1DEDB61/tmp/DemoSnapshotTestTests/testImageNotMatchingReference.1.png"

To configure output for a custom diff tool, like Kaleidoscope:

    SnapshotTesting.diffTool = "ksdiff"

Actual perceptual precision 0.09625 is less than required 0.99
Test Case '-[DemoSnapshotTestTests.DemoSnapshotTestTests testImageNotMatchingReference]' failed (0.095 seconds).
Test Case '-[DemoSnapshotTestTests.DemoSnapshotTestTests testSimplyFailing]' started.
/Users/meik.schuetz/Developer/viz/ios/temp/DemoSnapshotTest/DemoSnapshotTestTests/DemoSnapshotTestTests.swift:38: error: -[DemoSnapshotTestTests.DemoSnapshotTestTests testSimplyFailing] : XCTAssertTrue failed
Test Case '-[DemoSnapshotTestTests.DemoSnapshotTestTests testSimplyFailing]' failed (0.001 seconds).
Test Case '-[DemoSnapshotTestTests.DemoSnapshotTestTests testSimplySucceeding]' started.
Test Case '-[DemoSnapshotTestTests.DemoSnapshotTestTests testSimplySucceeding]' passed (0.000 seconds).
Test Suite 'DemoSnapshotTestTests' failed at 2023-01-31 15:10:35.971.
	 Executed 4 tests, with 2 failures (0 unexpected) in 0.110 (0.110) seconds
Test Suite 'DemoSnapshotTestTests.xctest' failed at 2023-01-31 15:10:35.971.
	 Executed 4 tests, with 2 failures (0 unexpected) in 0.110 (0.111) seconds
Test Suite 'Selected tests' failed at 2023-01-31 15:10:35.972.
	 Executed 4 tests, with 2 failures (0 unexpected) in 0.110 (0.111) seconds
```

## Output when running on Github Actions
```
Test Suite 'All tests' started at 2023-01-31 15:19:10.147
Test Suite 'DemoSnapshotTestTests.xctest' started at 2023-01-31 15:19:10.148
Test Suite 'DemoSnapshotTestTests' started at 2023-01-31 15:19:10.148
Test Case '-[DemoSnapshotTestTests.DemoSnapshotTestTests testImageMatchingReference]' started.
Test Case '-[DemoSnapshotTestTests.DemoSnapshotTestTests testImageMatchingReference]' passed (0.024 seconds).
Test Case '-[DemoSnapshotTestTests.DemoSnapshotTestTests testImageNotMatchingReference]' started.
2023-01-31 15:19:10.361431+0000 DemoSnapshotTest[6209:20220] [api] No Metal renderer available.
2023-01-31 15:19:10.866762+0000 DemoSnapshotTest[6209:20220] [api] -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:] format Rf on GLES.
Test Case '-[DemoSnapshotTestTests.DemoSnapshotTestTests testImageNotMatchingReference]' passed (0.695 seconds).
Test Case '-[DemoSnapshotTestTests.DemoSnapshotTestTests testSimplyFailing]' started.
/Users/runner/work/DemoSnapshotTest/DemoSnapshotTest/DemoSnapshotTestTests/DemoSnapshotTestTests.swift:38: error: -[DemoSnapshotTestTests.DemoSnapshotTestTests testSimplyFailing] : XCTAssertTrue failed
Test Case '-[DemoSnapshotTestTests.DemoSnapshotTestTests testSimplyFailing]' failed (0.305 seconds).
Test Case '-[DemoSnapshotTestTests.DemoSnapshotTestTests testSimplySucceeding]' started.
Test Case '-[DemoSnapshotTestTests.DemoSnapshotTestTests testSimplySucceeding]' passed (0.001 seconds).
Test Suite 'DemoSnapshotTestTests' failed at 2023-01-31 15:19:11.176.
	 Executed 4 tests, with 1 failure (0 unexpected) in 1.025 (1.028) seconds
Test Suite 'DemoSnapshotTestTests.xctest' failed at 2023-01-31 15:19:11.177.
	 Executed 4 tests, with 1 failure (0 unexpected) in 1.025 (1.029) seconds
Test Suite 'All tests' failed at 2023-01-31 15:19:11.177.
	 Executed 4 tests, with 1 failure (0 unexpected) in 1.025 (1.030) seconds
```
