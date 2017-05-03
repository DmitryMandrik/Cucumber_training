Given(/^I am on Inbox page$/) do
  visit LoginPage
  on(LoginPage) do |login_page|
    login_page.access_to_another_acc_element.click if login_page.access_to_another_acc_element.exists?
    login_page.use_another_account_element.click if login_page.use_another_account_element.exists?
    login_page.email_field_element.click
    login_page.email_field_element.send_keys "dmitrymandrik123@gmail.com "
    login_page.email_next_button_element.element.wd.click
    login_page.password_field_element.send_keys "1qaz!QAZ1q"
    login_page.password_next_button_element.element.wd.click
  end
end

When(/^I click at Google Account menu button$/) do
  on(InboxPage).account_menu_element.click
end

# how to stay signed in?

And(/^I click at Sign Out button$/) do
  on(InboxPage).sign_out_button_element.when_present.click
end

Then(/^I logged out$/) do
  expect(on(LoginPage).password_next_button_element.exists?).to be(true)
end

Given(/^I have opened Compose email pop up$/) do
  on(InboxPage).compose_button_element.click
end

When(/^I enter my email in CC field$/) do
  on(InboxPage).recipient_element.send_keys "dmitrymandrik123@gmail.com"
end

When(/^I enter Subject$/) do
  on(InboxPage) do |inbox_page|
    inbox_page.subject_element.click
    inbox_page.subject_element.send_keys "Test Email"
  end
end

