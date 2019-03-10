
Pod::Spec.new do |spec|


  spec.name         = "KIRIAnimatedTabBar"
  spec.version      = "1.0.0"
  spec.summary      = "Animated Tabbar Items"
  spec.description  = "Library made in Swift helps to add various type of animations to your TabbarController tab items."
  spec.homepage     = "https://github.com/nakumKishan/KIRIAnimatedTabBar"
  spec.license      = "MIT"
  spec.author       = { "Kishan Nakum" => "nakum84@gmail.com" }
  spec.platform     = :ios, "12.0"
  spec.source       = { :git => "https://github.com/nakumKishan/KIRIAnimatedTabBar.git", :tag => "1.0.0" }
  spec.source_files  = "KIRIAnimatedTabBar/**/*"
  spec.exclude_files = "KIRIAnimatedTabBar/**/*.plist"
end
