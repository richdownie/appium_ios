# frozen_string_literal: true

require 'appium_lib'
require 'selenium-webdriver'

# Set the desired capabilities for your specific app
caps = {
  "platformName": 'iOS',
  "appium:platformVersion": '17.2',
  "appium:deviceName": 'iPhone 15 Pro Max',
  "appium:automationName": 'XCUITest',
  "appium:app": 'com.apple.Preferences'
}

# Initialize the Appium driver
driver = Appium::Driver.new({ caps: caps, appium_lib: { server_url: 'http://127.0.0.1:4723/' } })

# Start the Appium Driver
driver.start_driver

# Take a screenshot
driver.save_viewport_screenshot('view_screenshot_at_failed_step.png')

# Quit the driver
driver.quit
