class AnotherLoginPage
  include PageObject

  page_url ENV['PAGE_URL']||'https://gmail.com'

  span(:access_to_another_acc, xpath: "//*[@id='view_container']/form/div[1]/div/div/div[2]/div/content/span/span")
  div(:use_another_account, xpath: "//*[@id='identifierLink']/div[2]/p/text()")

  element(:email_field, css: '#Email')
  element(:password_field, css: '#Passwd')
end