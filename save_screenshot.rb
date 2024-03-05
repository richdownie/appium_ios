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

# Instantiate and start a new Appium Driver
driver = Appium::Driver.new({ caps:, appium_lib: { server_url: 'http://127.0.0.1:4723/' } }).start_driver

# ******************************************************
# Add Implicit Wait
driver.manage.timeouts.implicit_wait = 1 # 10 second
# ******************************************************

# Perform actions on the app
driver.find_element(name: 'General').click
driver.find_element(name: 'About').click

# Save a screenshot
driver.save_screenshot('snag_it.png')
