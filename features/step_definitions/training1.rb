When(/^I started browser$/) do
  @browser.goto 'tut.by'
  puts @browser.title
end

Then(/^Everything is good$/) do

  @browser.element(css: "ul[class*='footer_link__list'] li[class='footer_link__item footer__header'] a[href='https://tutby.com/advert/price/']").click
  @browser.element(css: "ul[class='b-voter-list'] li:nth-of-type(2) input").click
  @browser.element(css: "div[id='poll-widget'] button").click

  sleep 5
  puts @browser.titlev
end