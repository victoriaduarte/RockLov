require "allure-cucumber"
require "capybara"
require "capybara/cucumber"  # importa o capybara para o projeto cucumber

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = "http://rocklov-web:3000"
  config.default_max_wait_time = 15
end

AllureCucumber.configure do |config|
  config.results_directory = "/logs"
  config.clean_results_directory = true
end
