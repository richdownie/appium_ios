# frozen_string_literal: true

require 'selenium-webdriver'
require 'httparty'
require 'dotenv'
require 'rspec'
require 'pry'
require 'appium_lib'

require_relative 'chatgpt_helper'

# MOBILE
RSpec.configure do |config|
  # Load .env file
  Dotenv.load

  config.after do |example|
    if example.exception
      # binding.pry
    end
  end
end
