Pod::Spec.new do |s|
  s.name             = 'HiSwiftUI'
  s.version          = '1.1.1'
  s.summary          = 'iOS App Framework'
  s.description      = <<-DESC
						iOS App Framework with SwiftUI.
                       DESC
  s.homepage         = 'https://github.com/tospery/HiSwiftUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'YangJianxiang' => 'tospery@gmail.com' }
  s.source           = { :git => 'https://github.com/tospery/HiSwiftUI.git', :tag => s.version.to_s }

  s.requires_arc = true
  s.swift_version = '5.3'
  s.ios.deployment_target = '16.0'
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit', 'SwiftUI'
  
  s.source_files = 'HiSwiftUI/**/*'
  s.dependency 'HiCore', '~> 1.0'
  s.dependency 'HiNav/Combine', '~> 1.0'
  s.dependency 'HiNet/Combine', '~> 1.0'
  s.dependency 'HiResource', '~> 1.0'
  s.dependency 'SFSafeSymbols', '~> 5.0'
  s.dependency 'CombineExt', '~> 1.0'
  s.dependency 'SwifterSwift', '~> 6.0'
  s.dependency 'Kingfisher', '~> 7.0'
  s.dependency 'Refresh-Hi', '~> 0.2'
  s.dependency 'SwiftUIKit-Hi', '~> 5.0.0'
  
end
