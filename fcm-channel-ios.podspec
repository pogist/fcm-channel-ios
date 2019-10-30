#
# Be sure to run `pod lib lint fcm-channel-ios.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'fcm-channel-ios'
  s.version          = '0.4.0'
  s.summary          = 'FCM Channel iOS is a client library for Rapid Pro platform.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
FCM Channel iOS is a client library for Rapid Pro platform that can be used inside iOS apps to enable users receive and send messages through Firebase Cloud Messaging channel.
                       DESC

  s.homepage         = 'https://github.com/push-flow/fcm-channel-ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'AGPL-3.0', :file => 'LICENSE' }
  s.author           = { 'rubenspessoa' => 'pessoadebarros@gmail.com' }
  s.source           = { :git => 'https://github.com/push-flow/fcm-channel-ios.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.3'
  s.swift_version = '4.2'
  s.static_framework = true

  s.source_files = 'fcm-channel-ios/Classes/**/*.{m,h,swift}'

  s.resource_bundles = {
    'fcm-channel-ios' => [
      'fcm-channel-ios/Assets/*.png',
      'fcm-channel-ios/Classes/**/*.{xib}'
    ]
  }

  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES'
  }

  s.xcconfig = {
    'SWIFT_INCLUDE_PATHS' => '${PODS_ROOT}/fcm-channel-ios/Classes',
  }

  s.public_header_files = 'fcm-channel-ios/Classes/**/*.{h}'

  # Link the generated swift header for use from static libraries
  s.script_phase = {
    name: 'Link Swift headers',
    script: <<-SH
target_dir=${BUILT_PRODUCTS_DIR}/include/${PRODUCT_MODULE_NAME}/

# Ensure the target include path exists
mkdir -p ${target_dir}

# Copy any file that looks like a Swift generated header to the include path
if [ ! -f ${DERIVED_SOURCES_DIR}/*-Swift.h ]; then
  echo "No swift headers found."
else
  cp ${DERIVED_SOURCES_DIR}/*-Swift.h ${target_dir}
  echo "Copied headers!"
fi
    SH
  }

  s.frameworks = 'UIKit'
  s.dependency 'AlamofireObjectMapper', '5.2.0'
  s.dependency 'Alamofire', '4.9.0'
  s.dependency 'MDHTMLLabel', '1.0.2'
  s.dependency 'MBProgressHUD', '1.1.0'
  s.dependency 'TPKeyboardAvoiding'
  s.dependency 'ISScrollViewPageSwift', '1.0.0'
  s.dependency 'Reusable', '4.0.5'
  s.dependency 'IGListKit', '3.4.0'
end
