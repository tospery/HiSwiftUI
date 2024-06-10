Pod::Spec.new do |s|
  s.name             = 'HiSwiftUI'
  s.version          = '1.0.0'
  s.summary          = 'Hi SwiftUI.'
  s.description      = <<-DESC
						Hi for SwiftUI.
                       DESC
  s.homepage         = 'https://github.com/tospery/HiSwiftUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'YangJianxiang' => 'tospery@gmail.com' }
  s.source           = { :git => 'https://github.com/tospery/HiSwiftUI.git', :tag => s.version.to_s }

  s.requires_arc = true
  s.swift_version = '5.3'
  s.ios.deployment_target = '16.0'
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
  
  s.source_files = 'HiSwiftUI/**/*'
  s.dependency 'FCUUID', '~> 1.0'
  s.dependency 'DeviceKit', '~> 5.0'
  s.dependency 'SwiftyBeaver', '~> 1.0'
  s.dependency 'ObjectMapper', '~> 4.0'
  s.dependency 'SwifterSwift/SwiftStdlib', '~> 6.0'
  s.dependency 'SwifterSwift/Foundation', '~> 6.0'
  s.dependency 'SwifterSwift/CoreGraphics', '~> 6.0'
  s.dependency 'SwifterSwift/UIKit', '~> 6.0'
  
end
