Pod::Spec.new do |s|
  s.name             = 'WKWebViewController'
  s.version          = "1.0.0"
  s.summary          = "An UIViewController with WKWebView inside."
  s.homepage         = "https://github.com/Meniny/WKWebViewController"
  s.license          = { :type => "MIT", :file => "LICENSE.md" }
  s.author           = 'Elias Abel'
  s.source           = { :git => "https://github.com/Meniny/WKWebViewController.git", :tag => s.version.to_s }
  s.swift_version    = "4.0"
  s.social_media_url = 'https://meniny.cn/'
  s.source_files     = "WKWebViewController/**/*.swift"
  s.resources        = "WKWebViewController/Assets.xcassets"
  s.requires_arc     = true
  s.ios.deployment_target = "9.0"
  s.description  = "WKWebViewController is an UIViewController with WKWebView inside."
  s.module_name = 'WKWebViewController'
end
