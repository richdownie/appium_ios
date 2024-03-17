# frozen_string_literal: true

require 'appium_lib'
require 'colorize'
require 'dotenv'
require 'httparty'
require 'pry'

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

# Perform actions in the app
driver.find_element(name: 'General').click
driver.find_element(name: 'Keyboard').click
sleep 3
driver.find_element(:accessibility_id, 'Keyboards').click
# driver.find_element(:accessibility_id, 'AddNewKeyboard').click

if ENV['CHAT']
  # Your ChatGPT API token
  open_ai_key = ENV.fetch('OPEN_AI_KEY')

  # API endpoint
  api_endpoint = 'https://api.openai.com/v1/chat/completions?'

  # Prompt the user to enter some text
  print 'Ask ChatGPT: '

  # Read the input from the user
  user_input = gets.chomp

  # Send a request to the API
  response = HTTParty.post(api_endpoint,
                           headers: {
                             'Content-Type' => 'application/json',
                             'Authorization' => "Bearer #{open_ai_key}"
                           },
                           body: {
                             "model": 'gpt-4-turbo-preview',
                             "messages": [
                               {
                                 "role": 'user',
                                 "content": "#{user_input} with appium ruby #{driver.page_source}"
                               }
                             ]
                           }.to_json)

  # Print response
  puts "** ChatGPT Suggests: ** \n #{response['choices'].first['message']['content']}".green
end
