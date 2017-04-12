require 'cucumber'
require 'selenium-webdriver'
require 'watir'
require 'watir-scroll'

# browser = Watir::Browser.new :chrome

Before do |scenario|
  @browser = Watir::Browser.new
  width = @browser.execute_script('return screen.width;')
  height = @browser.execute_script('return screen.height;')
  @browser.driver.manage.window.move_to(0,0)
  @browser.driver.manage.window.resize_to(width,height)
end

After do |scenario|
  @browser.close
  puts 'Browser closed!'
end
