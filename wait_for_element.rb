# frozen_string_literal: true

require 'appium_lib'

# Set your desired capabilities
caps = {
  "platformName": 'iOS',
  "appium:platformVersion": '17.2',
  "appium:deviceName": 'iPhone 15 Pro Max',
  "appium:automationName": 'XCUITest',
  "appium:app": 'com.apple.Preferences'
}
# Instantiate a new Appium Driver
driver = Appium::Driver.new({ caps: caps, appium_lib: { server_url: 'http://127.0.0.1:4723/' } })

# Start the Appium Driver
driver.start_driver

# ******************************************************
# Add Implicit Wait
# driver.manage.timeouts.implicit_wait = 10 # 10 seconds
# ******************************************************

# Perform actions on the app
driver.find_element(name: 'General').click

# **********************************************************
# Add Explicit Wait
# wait = Selenium::WebDriver::Wait.new(timeout: 10)
# element = wait.until { driver.find_element(name: 'About') }
# element.click
# **********************************************************
element = driver.find_element(name: 'About')

element.click
