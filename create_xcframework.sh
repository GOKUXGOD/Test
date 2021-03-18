xcodebuild -project TestXcFramework.xcodeproj -scheme TestXcFramework clean archive -configuration release -sdk iphoneos -archivePath "archives/ios_devices.xcarchive" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO

xcodebuild -project TestXcFramework.xcodeproj -scheme TestXcFramework clean archive -configuration release -sdk iphonesimulator -archivePath "archives/ios_simulators.xcarchive" \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO

xcodebuild -create-xcframework \
  -framework archives/ios_devices.xcarchive/Products/Library/Frameworks/TestXcFramework.framework \
  -framework archives/ios_simulators.xcarchive/Products/Library/Frameworks/TestXcFramework.framework \
  -output build/TestXcFramework.xcframework

rm -rf archives
