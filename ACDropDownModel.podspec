#
# Be sure to run `pod lib lint ACDropDownModel.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ACDropDownModel'
  s.version          = '0.1.0'
  s.summary          = 'DropDown Custom using DropDown dependency'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Create a view, this view is a dropdown target, than pus textfield and another view with zero heigth, this view is a anchor and create one array for data.
                       DESC

  s.homepage         = 'https://github.com/asfcarvalho/ACDropDownModel'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'asfcarvalho@me.com' => 'asfcarvalho@me.com' }
  s.source           = { :git => 'https://github.com/asfcarvalho/ACDropDownModel.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ACDropDownModel/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ACDropDownModel' => ['ACDropDownModel/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
    s.dependency 'DropDown', '~> 2'
end
