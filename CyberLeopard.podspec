#
# Be sure to run `pod lib lint CyberLeopard.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CyberLeopard'
  s.version          = '0.1.3'
  s.summary          = 'CyberLeopard is a Utility'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
It is a Utility this is used to perform basic Operation Like Json serilization
                       DESC

  s.homepage         = 'https://github.com/Shubham14031998/CyberLeopard'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Shubham Kaliyar' => 'shubhamkaliyar255@gmail.com' }
  s.source           = { :git => 'https://github.com/Shubham14031998/CyberLeopard.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CyberLeopard/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CyberLeopard' => ['CyberLeopard/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
