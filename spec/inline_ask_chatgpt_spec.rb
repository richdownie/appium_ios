# frozen_string_literal: true

RSpec.describe 'ChatGPT' do
  # Set your desired capabilities
  caps = {
    platformName: 'iOS',
    platformVersion: '17.2',
    deviceName: 'iPhone 15 Pro Max',
    automationName: 'XCUITest',
    'appium:app': 'com.apple.Preferences'
  }
  let(:driver) { Appium::Driver.new({ caps:, appium_lib: { server_url: 'http://127.0.0.1:4723/' } }).start_driver }

  it 'ask for accessibility id locator' do
    # Perform actions in the app
    begin
      driver.find_element(id: 'General').click
      driver.find_element(id: 'Keyboard').click
      driver.find_element(id: '2').click
      driver.find_element(id: "Add New Keyboard...").click
      expect(driver.find_element(id: 'Add New Keyboard').displayed?).to be true
    rescue
      ChatGPTHelper.new.ask(driver.page_source)
    end
  end
end
