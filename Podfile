# Uncomment the next line to define a global platform for your project
platform :ios, '13.2'

target 'Car Park System' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for Report & Notification
  pod 'NotificationBannerSwift', '~> 3.0.0'
  pod 'Charts'
  pod 'SVProgressHUD'
  pod 'ChameleonFramework'
  pod 'QuickTableViewController'
  pod 'Malert'
  pod 'Firebase/Database'

  # Pods for Car Park System
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CLANG_WARN_DOCUMENTATION_COMMENTS'] = 'NO'
        end
    end
end
