Given(/^I have calculator ruby class$/) do
  require_relative '../../features/entities/calculator'
  $calc = Calculator.new
end

When(/^I set (\d+) number and (\d+) number$/) do |a, b|
  $calc.a= a.to_i
  $calc.b= b.to_i
end

And(/^I request sum of this numbers$/) do
  $calc.sum
end

Then(/^I the (\d+) is correct$/) do |sum|
  expect($calc.summary).to eq(sum.to_i)
end

And(/^I request mult of this numbers$/) do
  $calc.multiply
end

Then(/^I (\d+) is correct$/) do |mult|
  expect($calc.mult).to eq(mult.to_i)
end