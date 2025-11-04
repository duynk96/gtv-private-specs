Pod::Spec.new do |s|
    s.name             = 'GTVSdk'
    s.version          = '1.0.8'
    s.summary          = 'GTV SDK cho iOS'
    s.description      = <<-DESC
    SDK hỗ trợ login, notification, tracking và quảng cáo cho ứng dụng iOS.
    DESC
    
    s.homepage         = 'https://github.com/duynk96/gtv-private-specs'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'duynk96' => 'duynk@gtv.vn' }
    s.source           = { :git => 'https://github.com/duynk96/gtv-private-specs.git', :branch => 'main' }

    s.ios.deployment_target = '15.0'
    s.swift_versions   = ['5.0', '5.5', '5.9']
    
    # Sử dụng framework động (not static)
    s.static_framework = false
    
    
    # -------------------------------------------------
    # MARK: - Core Subspec
    # -------------------------------------------------
    s.subspec 'Core' do |core|
        # Framework đã build sẵn
        core.vendored_frameworks = 'GTVSdkIos.xcframework'
        
        # Các thư viện phụ thuộc
        core.dependency 'Firebase/Messaging', '~> 12.3.0'
        core.dependency 'airbridge-ios-sdk', '~> 4.8.1'
        # core.dependency 'Adjust', '~> 5.4.4'
    end
    
    # -------------------------------------------------
    # MARK: - Full Subspec (gồm Ads)
    # -------------------------------------------------
    s.subspec 'Full' do |full|
        
        # Source code
        full.source_files = 'Sources/**/*.{swift,h,m}'
        
        # Resource bundle riêng cho SDK
        full.resource_bundles = {
            'GTVSdkResources' => ['Resources/**/*.{png,jpg,json,xib,storyboard}']
        }
        
        # full.vendored_frameworks = 'FrameworkFull/GTVSdkIos.xcframework'
        
        full.dependency 'Google-Mobile-Ads-SDK', '~> 12.11.0'
        full.dependency 'Firebase/Messaging', '~> 12.3.0'
        full.dependency 'airbridge-ios-sdk', '~> 4.8.1'
        # full.dependency 'Adjust', '~> 5.4.4'
    end
    
    # -------------------------------------------------
    # MARK: - Default
    # -------------------------------------------------
    s.default_subspecs = 'Core'
end

