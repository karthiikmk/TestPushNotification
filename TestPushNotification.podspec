

Pod::Spec.new do |s|
  s.name             = 'TestPushNotification'
  s.version          = '1.1'
  s.swift_version    = '4.0'
  s.summary          = 'A candy for firing notification with custom payloads'
  s.description      = 'Testing Notification is always hard when it comes to iOS. Here is a small chunk which uses firebase api, where you can pass your custom payload to fire a notification.'
  s.homepage         = 'https://github.com/karthikAdaptavant/TestPushNotification'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'karthikAdaptavant' => 'karthik.samy@a-cti.com' }
  s.source           = { :git => 'https://github.com/karthikAdaptavant/TestPushNotification.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/i_am_kaarthik'
  s.ios.deployment_target = '9.0'
  s.source_files = 'Sources/TestPushNotification/Classes/**/*'
  s.dependency 'Alamofire', '~> 4.7'
  s.dependency 'SwiftyJSON', '4.0'

end
