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
require_relative 'scenario_data_holder'
require 'rest-client'

Before do |scenario|
  @browser = Watir::Browser.new
  width = @browser.execute_script('return screen.width;')
  height = @browser.execute_script('return screen.height;')
  @browser.driver.manage.window.move_to(0,0)
  @browser.driver.manage.window.resize_to(width,height)
  @metadata = Hash.new
  @metadata[:feature] = scenario.feature.name
  @metadata[:scenario] = scenario.name
  @metadata[:tags] = scenario.source_tag_names
end

After do |scenario|
  if scenario.failed?
    screenshot_file = "FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}_#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
    screenshot_file = File.join('report', screenshot_file)
    @browser.driver.save_screenshot(screenshot_file)
    embed(screenshot_file, 'image/png')
    @browser.close
  else
    @browser.close
  end
end

