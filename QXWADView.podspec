#
# Be sure to run `pod lib lint QXWADView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QXWADView'
  s.version          = '0.0.2'
  s.summary          = '应用启动时的广告页快速添加'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
应用启动时，快速的添加广告页。并且实现跳转。
                       DESC

  s.homepage         = 'https://github.com/wangqingxue/QXWAdView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '173636717@qq.com' => '173636717@qq.com' }
  s.source           = { :git => 'https://github.com/wangqingxue/QXWAdView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'QXWADView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'QXWADView' => ['QXWADView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
