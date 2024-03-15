# frozen_string_literal: true

require 'appium_lib'
require 'httparty'
require 'dotenv'
require 'colorize'

Dotenv.load

# Set your desired capabilities
caps = {
  platformName: 'iOS',
  platformVersion: '17.2',
  deviceName: 'iPhone 15 Pro Max',
  automationName: 'XCUITest',
  'appium:app': 'com.apple.Preferences'
}
# Instantiate a new Appium Driver
driver = Appium::Driver.new({ caps:, appium_lib: { server_url: 'http://127.0.0.1:4723/' } }).start_driver


begin
  # Perform actions in the app
  driver.find_element(name: 'General').click
  driver.find_element(name: 'Android').click
  puts "Test Passed! No need to ping ChatGPT."
rescue => e
  puts "** Error Message: ** \n #{e.message}".red

  # Your ChatGPT API token
  open_ai_key = "#{ENV.fetch('OPEN_AI_KEY')}"

  # API endpoint
  api_endpoint = 'https://api.openai.com/v1/chat/completions?'

  # Send a request to the API
  response = HTTParty.post(api_endpoint,
                           headers: {
                             'Content-Type' => 'application/json',
                             'Authorization' => "Bearer #{open_ai_key}"
                           },
                           body: {
                             "model": "gpt-4-turbo-preview",
                             "messages": [
                               {
                                 "role": "user",
                                 "content": "What are some fixes in ruby for the following error? #{e.message}"
                               }
                             ]
                           }.to_json)

  # Print response
  puts device_name = "** ChatGPT suggests: ** \n #{response["choices"].first["message"]["content"]}".green
end
