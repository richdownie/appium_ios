# frozen_string_literal: true

require 'selenium-webdriver'
require 'httparty'
require 'dotenv'
require 'rspec'
require 'pry'
require 'appium_lib'

# MOBILE
RSpec.configure do |config|
  # Load .env file
  Dotenv.load

  # Set your desired capabilities
  caps = {
    platformName: 'iOS',
    platformVersion: '17.2',
    deviceName: 'iPhone 15 Pro Max',
    automationName: 'XCUITest',
    'appium:app': 'com.apple.Preferences'
  }
  config.before(:each) do
    @driver = Appium::Driver.new({ caps:, appium_lib: { server_url: 'http://127.0.0.1:4723/' } }).start_driver
  end

  config.after(:each) do |example|
    if example.exception
      # binding.pry
    end
  end
end
