#
# Be sure to run `pod lib lint cleardil_ios_sdk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'cleardil_ios_sdk'
  s.version          = '1.3.2'
  s.summary          = 'A short description of cleardil_ios_sdk.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://reference.cleardil.com/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'AbdelSefiane' => 'abdel.sefiane@gmail.com' }
  s.source           = { :git1 => 'https://github.com/ClearDil/cleardil_ios_sdk.git', :tag => '1.3.2' }

  s.ios.deployment_target = '9.0'
 
  s.source_files = 'cleardil_ios_sdk/Classes/*'
  
  s.dependency 'Flutter', '~> 2.5'
  s.vendored_frameworks = 'cleardil_ios_sdk/permission_handler.xcframework',  'cleardil_ios_sdk/device_info_plus.xcframework',  'cleardil_ios_sdk/App.xcframework', 'cleardil_ios_sdk/FlutterPluginRegistrant.xcframework', 'cleardil_ios_sdk/camera.xcframework' , 'cleardil_ios_sdk/path_provider_ios.xcframework', 'cleardil_ios_sdk/package_info_plus.xcframework'

end
