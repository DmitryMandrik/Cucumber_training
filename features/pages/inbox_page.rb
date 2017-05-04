class InboxPage
  include PageObject

  page_url ENV['PAGE_URL']||'https://mail.google.com/mail/'

  a(:inbox_locator, css: 'a[href="https://mail.google.com/mail/#inbox"]')
  span(:account_menu, xpath: "//*[@id='gb']/div[1]/div[1]/div[2]/div[4]/div[1]/a/span")
  a(:sign_out_button, xpath: "//a[text()='Sign out']")
  div(:compose_button, xpath: "//div[text()='COMPOSE']")
  text_area(:recipient, xpath: "//textarea[@name='to']")
  element(:subject, xpath: "//input[@aria-label='Subject']")
  div(:send_button, xpath: "//div[text()='Send']")
  b(:email_subject_in_list, xpath: "//b[text()='Test Email']")
end