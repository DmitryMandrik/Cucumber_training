Given(/^I am on login page$/) do
  visit LoginPage
end

And(/^I identify Login Page$/) do
  if on(AnotherLoginPage).email_field_element.exists?
    @browser.refresh
  end
end

When(/^I click on arrow button$/) do
  on(LoginPage) do |login_page|
    login_page.access_to_another_acc_element.click if login_page.access_to_another_acc_element.exists?
  end
end

When(/^I click on Use another account button$/) do
  on(LoginPage) do |login_page|
    login_page.use_another_account_element.click if login_page.use_another_account_element.exists?
  end
end

And(/^I enter valid email/) do
  on(LoginPage) do |login_page|
    login_page.email_field_element.click
    login_page.email_field_element.send_keys "dmitrymandrik123@gmail.com "
  end
end

And(/^I click Next button$/) do
  on(LoginPage) do |login_page|
    if login_page.email_next_button_element.exists?
      login_page.email_next_button_element.element.wd.click
    else
      login_page.password_next_button_element.element.wd.click
    end
  end
end

And(/^I enter valid password$/) do
  on(LoginPage).password_field_element.send_keys "1qaz!QAZ1q"
end

Then(/^I logged in$/) do
  sleep 5
  expect(on(InboxPage).inbox_locator_element.exists?).to be(true)
end


And(/^I enter invalid email$/) do
  on(LoginPage).email_field_element.send_keys "detrer@"
end

And(/^error message appears 'Enter an email or phone number'$/) do
  sleep 1
  expect(on(LoginPage).invalid_email_error_element.exists?).to be(true)
end

And(/^I enter invalid password$/) do
  on(LoginPage).password_field_element.send_keys "1q"
end

And(/^error message appears 'Wrong password. Try again.'$/) do
  expect(on(LoginPage).empty_password_error_element.exists?).to be(true)
end