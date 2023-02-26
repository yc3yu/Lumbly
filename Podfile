# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'OAidherence' do
  pod 'SwiftGen', '~> 6.0'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
      if target.respond_to?(:product_type) and target.product_type == "com.apple.product-type.bundle"
        target.build_configurations.each do |config|
            config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
        end
      end
    end
  end
