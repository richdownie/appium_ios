# frozen_string_literal: true

# Descriptive syntax
RSpec.describe 'Keyboards' do
  # Set your desired capabilities
  caps = {
    platformName: 'iOS',
    platformVersion: '17.4',
    deviceName: 'iPhone 15 Pro Max',
    automationName: 'XCUITest',
    'appium:app': 'com.apple.Preferences'
  }
  # Start Appium Driver
  let(:driver) { Appium::Driver.new({ caps:, appium_lib: { server_url: 'http://127.0.0.1:4723/' } }).start_driver }

  # Hook
  before do
    driver.manage.timeouts.implicit_wait = 1
    driver.find_element(id: 'General').click
    driver.find_element(id: 'Keyboard').click
  end

  it 'add new' do
    driver.find_element(id: '2').click
    driver.find_element(id: 'AddNewKeyboard').click
    driver.find_element(id: 'ak').click
    expect(driver.find_element(id: 'ak@sw=QWERTY-Akan;hw=Automatic').displayed?).to be true # Matcher
  end

  it 'delete' do
    driver.find_element(id: '3').click
    driver.find_element(id: 'Edit').click
    driver.find_element(id: 'Remove Akan').click
    driver.find_element(id: 'Delete').click
    driver.find_element(id: 'Done').click
    expect(driver.find_elements(id: 'ak@sw=QWERTY-Akan;hw=Automatic').count).to be 0 # Matcher
  end
end
