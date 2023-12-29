require 'appium_lib'

# Set your desired capabilities
caps = {
  "platformName": "iOS",
  "appium:platformVersion": "17.2",
  "appium:deviceName": "iPhone 15 Pro Max",
  "appium:automationName": "XCUITest",
  "appium:app": "com.apple.Preferences"
}
# Instantiate a new Appium Driver
driver = Appium::Driver.new({ caps: caps, appium_lib: { server_url: 'http://127.0.0.1:4723/' } })

# Start the Appium Driver
driver.start_driver
