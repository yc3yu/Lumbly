platform :ios, '16.0'

target 'Lumbly' do
  use_frameworks!
  pod 'SwiftGen', '~> 6.0'
  pod 'AZSClient'
  pod 'FLAnimatedImage'
  pod 'JellyGif'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.respond_to?(:product_type) and target.product_type == "com.apple.product-type.bundle"
      target.build_configurations.each do |config|
        config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
      end
    end
    
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end
