Feature: Login
  As a User
  I log in my google mail account

  Background:
    Given I am on login page
    And I identify Login Page

  Scenario: User logs in with valid credentials
    When I click on arrow button
    And I click on Use another account button
    And I enter valid email
    And I click Next button
    And I enter valid password
    And I click Next button
    Then I logged in

  Scenario: User logs in with invalid email
    When I click on arrow button
    And I click on Use another account button
    And I enter invalid email
    And I click Next button
    And error message appears 'Enter an email or phone number'


  Scenario: User logs in with invalid password
    When I click on arrow button
    And I click on Use another account button
    And I enter valid email
    And I click Next button
    And I enter invalid password
    And I click Next button
    And error message appears 'Wrong password. Try again.'


