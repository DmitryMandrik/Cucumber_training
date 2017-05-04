Given(/^I am logged in$/) do
  visit LoginPage
  if on(AnotherLoginPage).email_field_element.exists?
  on(AnotherLoginPage) do |another_login_page|
      another_login_page.email_field_element.send_keys "dmitrymandrik123@gmail.com", :enter
      another_login_page.password_field_element.send_keys "1qaz!QAZ1q", :enter
  end
  else
    on(LoginPage) do |login_page|
      login_page.access_to_another_acc_element.click if login_page.access_to_another_acc_element.exists?
      login_page.use_another_account_element.click if login_page.use_another_account_element.exists?
      login_page.email_field_element.send_keys "dmitrymandrik123@gmail.com ", :enter
      login_page.password_field_element.send_keys "1qaz!QAZ1q", :enter
      login_page.enter_city_element.send_keys "Minsk", :enter if login_page.enter_city_element.exists?
    end
  end
end

When(/^I click at Google Account menu button$/) do
  on(InboxPage).account_menu_element.click
end

And(/^I click at Sign Out button$/) do
  on(InboxPage).sign_out_button_element.when_present.click
end

Then(/^I logged out$/) do
  expect(on(LoginPage).password_next_button_element.exists?).to be(true)
end

Given(/^I have opened Compose email pop up$/) do
  on(InboxPage).compose_button_element.when_present.click
end

When(/^I enter my email in CC field$/) do
  on(InboxPage).recipient_element.send_keys "dmitrymandrik123@gmail.com", :enter
end

When(/^I enter Subject$/) do
  on(InboxPage) do |inbox_page|
    inbox_page.subject_element.element.wd.click
    inbox_page.subject_element.element.wd.send_keys "Test Email"
  end
end


And(/^I click Send button$/) do
  on(InboxPage).send_button_element.click
  sleep 3
  @browser.refresh
end

Then(/^email is visible on Inbox page$/) do
  expect(on(InboxPage).email_subject_in_list_element.exists?).to be(true)
end