# frozen_string_literal: true

require 'appium_lib'

# Set your desired capabilities
caps = {
  platformName: 'iOS',
  platformVersion: '17.2',
  deviceName: 'iPhone 15 Pro Max',
  automationName: 'XCUITest',
  'appium:app': 'com.apple.Preferences'
}
# Instantiate a new Appium Driver
driver = Appium::Driver.new({ caps:, appium_lib: { server_url: 'http://127.0.0.1:4723/' } })

# Start the Appium Driver
driver.start_driver

driver.start_recording_screen video_quality: 'high'

# Perform actions on the app
driver.find_element(name: 'General').click
sleep 1
driver.find_element(name: 'About').click

# Stop recording screen
recording = driver.driver.stop_recording_screen

# Save recording to a file
File.open('video.mp4', 'wb') do |file|
  file.write(Base64.decode64(recording))
end
