# frozen_string_literal: true

require 'appium_lib'

# Set your desired capabilities
caps = {
  platformName: 'iOS',
  platformVersion: '17.4',
  deviceName: 'iPad (10th generation)',
  automationName: 'XCUITest',
  browserName: 'Safari'
}
# Instantiate and start a new Appium Driver
driver = Appium::Driver.new(caps:, appium_lib: { server_url: 'http://127.0.0.1:4723/' }).start_driver

# Add Implicit Wait
driver.manage.timeouts.implicit_wait = 1 # Wait up to 1 second between the below commands

driver.get('https://fullstackautomationwithruby.com')
driver.find_element(link_text: 'START SESSIONS').click
driver.find_element(id: 'selenium-button').click
driver.find_element(id: 'ruby-button').click
driver.find_element(link_text: 'Automation Tools >>').click
