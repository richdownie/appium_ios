# frozen_string_literal: true

require 'appium_lib'

# Set your desired capabilities
caps = {
  platformName: 'iOS',
  platformVersion: '17.4',
  deviceName: 'iPad (10th generation)',
  automationName: 'XCUITest',
  'appium:app': 'com.apple.Preferences'
}

# Instantiate a new Appium Driver
driver = Appium::Driver.new({ caps:, appium_lib: { server_url: 'http://127.0.0.1:4723/' } })

# Start the Appium Driver
driver.start_driver

# Add Implicit Wait
driver.manage.timeouts.implicit_wait = 1 # 1 second

# Perform actions on the app
driver.find_element(name: 'General').click
driver.find_element(id: 'Keyboard').click
driver.find_element(id: 'Text Replacement').click
driver.find_element(id: 'Search').click

# Drive keys on keyboard
driver.find_element(id: 'H').click
driver.find_element(id: 'a').click
driver.find_element(id: 'l').click
driver.find_element(id: 'o').click
3.times { driver.find_element(id: 'delete').click }
driver.find_element(id: 'o').click
driver.find_element(id: 'l').click
driver.find_element(id: 'a').click
