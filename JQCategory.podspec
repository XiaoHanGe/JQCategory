Pod::Spec.new do |s|
  s.name         = "JQCategory"
  s.version      = "0.0.1"
  s.summary      = "iOS commonly used in Category, convenient and practical library."
  s.homepage     = "https://github.com/XiaoHanGe/JQCategory"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "韩俊强" => "532167805@qq.com" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/XiaoHanGe/JQCategory.git", :tag => s.version.to_s }
  s.source_files  = "JQCategory", "JQCategory/**/*.{h,m}"
  s.public_header_files = "JQCategory/**/*.h"
  s.requires_arc = true
end
