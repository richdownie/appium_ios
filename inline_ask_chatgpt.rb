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

driver.manage.timeouts.implicit_wait = 1

begin
  # Perform actions in the app
  driver.find_element(id: 'General').click
  driver.find_element(id: 'Keyboard').click
  driver.find_element(id: '2').click
  # driver.find_element(id: "Add New Keyboard...").click
  puts 'Test passed!'
rescue StandardError
  puts 'Test failed!'
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
                             model: 'gpt-4-turbo-preview',
                             messages: [
                               {
                                 role: 'user',
                                 content: "#{user_input} with appium ruby #{driver.page_source}"
                               }
                             ]
                           }.to_json)

  # Print response
  puts "** ChatGPT Suggests: ** \n #{response['choices'].first['message']['content']}".green
end
