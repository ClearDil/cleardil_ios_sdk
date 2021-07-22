#
# Be sure to run `pod lib lint cleardil_kyc_pod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'cleardil_kyc_pod'
  s.version          = '1.0.0'
  s.summary          = 'A short description of cleardil_kyc_pod.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/AbdelSefiane/cleardil_kyc_pod'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'AbdelSefiane' => 'abdel.sefiane@gmail.com' }
  s.source           = { :git => 'https://github.com/ClearDil/kyc_pod.git', :tag => '1.0.0' }

  s.ios.deployment_target = '9.0'
 
  s.source_files = 'cleardil_kyc_pod/Classes/*'
  
  s.dependency 'Flutter', '~> 2.0'
  s.vendored_frameworks = 'cleardil_kyc_pod/App.xcframework', 'cleardil_kyc_pod/FlutterPluginRegistrant.xcframework', 'cleardil_kyc_pod/camera.xcframework' , 'cleardil_kyc_pod/path_provider.xcframework' 

end
