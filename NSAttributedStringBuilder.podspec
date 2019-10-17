#
# Be sure to run `pod lib lint NSAttributedStringBuilder.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NSAttributedStringBuilder'
  s.version          = '0.3.1'
  s.summary          = 'Composing NSAttributedString with SwiftUI-style syntax, powerd by the now pitching Function Builder.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Composing NSAttributedString with SwiftUI-style syntax, powerd by the now pitching Function Builder.

Project Link: https://github.com/ethanhuang13/NSAttributedStringBuilder
                       DESC

  s.homepage         = 'https://github.com/ethanhuang13/NSAttributedStringBuilder'
  s.swift_versions   = '5.1'
  # s.screenshots      = 'https://github.com/ethanhuang13/NSAttributedStringBuilder/blob/master/demo2.jpg', 
                       'https://github.com/ethanhuang13/NSAttributedStringBuilder/blob/master/demo.jpg'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ethanhuang13' => 'blesserx@gmail.com' }
  s.source           = { :git => 'https://github.com/ethanhuang13/NSAttributedStringBuilder.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ethanhuang13'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Sources/NSAttributedStringBuilder/*',
                   'Sources/NSAttributedStringBuilder/Components/*'
end
