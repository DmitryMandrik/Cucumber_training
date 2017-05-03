require 'bundler/setup'
require 'page-object'
require 'page-object/page_factory'
require 'yaml'
require 'logger'
require 'open-uri'
require 'net/http'
require 'net/https'
require 'uri'
require 'mechanize'
require 'anemone'
require 'parallel_tests'
require 'date'
require 'securerandom'
require 'rest-client'

World(PageObject::PageFactory)

if ENV['HEADLESS']
  require 'headless'
  headless = Headless.new
  headless.start
  at_exit do
    headless.destroy
  end
end

Before do
  @browser = Watir::Browser.new
  width = @browser.execute_script('return screen.width;')
  height = @browser.execute_script('return screen.height;')
  @browser.driver.manage.window.move_to(0,0)
  @browser.driver.manage.window.resize_to(width,height)
end

After do
  @browser.close
end

# $accounts =
#     {
#         "Account1" => ["rubyautomationtraining@gmail.com", "1qaz!QAZ1q"],
#     }

#why its not blue as in other project?
# data = {"username" => "#{$accounts["Account1"][0]}", "password" => "#{$accounts["Account1"][1]}"}