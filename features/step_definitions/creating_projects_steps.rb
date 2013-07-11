Given(/^I am on the homepage$/) do
  visit "/"
end

When(/^I follow "(.*?)"$/) do |title|
  click_on "New Project"
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, with|
  fill_in field, :with => with
end

When(/^I press "(.*?)"$/) do |title|
  click_on title
end

Then(/^I should see "(.*?)"$/) do |message|
  assert page.has_content?(message)
end
