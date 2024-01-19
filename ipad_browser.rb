# frozen_string_literal: true

require 'appium_lib'
require 'selenium-webdriver'

# Set your desired capabilities
caps = {
  "platformName": 'iOS',
  "appium:platformVersion": '17.2',
  "appium:deviceName": 'iPad (10th generation)',
  "appium:automationName": 'XCUITest',
  browserName: 'Safari'
}
# Instantiate a new Appium Driver
driver = Appium::Driver.new({ caps: caps, appium_lib: { server_url: 'http://127.0.0.1:4723/' } })

# Start the Appium Driver
driver.start_driver

driver.get('https://fullstackautomationwithruby.com')
sleep 1.5
driver.find_element(link_text: 'START SESSIONS').click
sleep 1.5
driver.find_element(id: 'selenium-button').click
sleep 1.5
driver.find_element(id: 'ruby-button').click
sleep 1.5
driver.find_element(link_text: 'Automation Tools >>').click
