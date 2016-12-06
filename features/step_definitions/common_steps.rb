# -*- encoding : utf-8 -*-
When(/^I fill the "(.*?)" field with "(.*?)"$/) do |label, value|
  fill_in label, with: value
end

When(/^I press the "(.*?)" button$/) do |caption|
  click_button caption
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content(text)
end

When(/^I click the "(.*?)" link$/) do |caption|
  click_link caption, match: :first
end

Then(/^I should see the notice "(.*?)"$/) do |content|
  expect(page).to have_selector ".notice", text: content
end
