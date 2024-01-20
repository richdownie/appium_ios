# frozen_string_literal: true

require 'appium_lib'
require 'selenium-webdriver'

# Set your desired capabilities
caps = {
  "platformName": 'iOS',
  "appium:platformVersion": '17.2',
  "appium:deviceName": 'iPhone 15 Pro Max',
  "appium:automationName": 'XCUITest',
  "appium:app": 'com.apple.Preferences'
}
# Instantiate a new Appium Driver
driver = Appium::Driver.new({ caps:, appium_lib: { server_url: 'http://127.0.0.1:4723/' } })

# Start the Appium Driver
driver.start_driver

# Perform actions on the app
driver.find_element(name: 'General').click
# **********************************************************
# Add Explicit Wait
puts 'Begin Explicit Wait'
start_time = Time.now
wait = Selenium::WebDriver::Wait.new(timeout: 10)
element = wait.until { driver.find_element(name: 'About') }
end_time = Time.now - start_time
puts "Explicit Wait Completed in #{end_time} seconds"
element.click
# **********************************************************
driver.find_element(name: 'About').click
