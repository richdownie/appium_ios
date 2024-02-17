# frozen_string_literal: true

require 'appium_lib'

# Set your desired capabilities
caps = {
  platformName: 'iOS',
  platformVersion: '17.2',
  deviceName: 'iPhone 15 Pro Max',
  automationName: 'XCUITest',
  "appium:app": 'com.apple.Preferences'
}

SERVER_URL = 'http://localhost:4723'

# Instantiate a new Appium Driver
@core = ::Appium::Core.for capabilities: caps
driver = @core.start_driver server_url: SERVER_URL

# Perform actions on the app
driver.find_element(name: 'General').click

x_coordinate = 200
y_coordinate = 400

# Execute tap action using execute_script
driver.execute_script('mobile: tap', x: x_coordinate, y: y_coordinate)

driver.execute_script('mobile: doubleTap', x: x_coordinate, y: y_coordinate)

driver.execute_script("mobile: scroll", { "direction" => "down"})

driver.execute_script('mobile: doubleTap')

# https://appium.readthedocs.io/en/latest/en/commands/mobile-command/