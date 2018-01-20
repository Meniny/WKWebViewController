Pod::Spec.new do |s|
  s.name             = 'WebViewController'
  s.version          = "1.0.0"
  s.summary          = "An UIViewController with WKWebView inside."
  s.homepage         = "https://github.com/Meniny/WebViewController"
  s.license          = { :type => "MIT", :file => "LICENSE.md" }
  s.author           = 'Elias Abel'
  s.source           = { :git => "https://github.com/Meniny/WebViewController.git", :tag => s.version.to_s }
  s.social_media_url = 'https://meniny.cn/'
  s.source_files     = "WebViewController/**/*.swift"
  s.resources        = "WebViewController/Assets.xcassets"
  s.requires_arc     = true
  s.ios.deployment_target = "9.0"
  s.description  = "WebViewController is an UIViewController with WKWebView inside."
  s.module_name = 'WebViewController'
end
