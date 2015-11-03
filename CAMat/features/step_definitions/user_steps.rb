Given(/^I am at the user creation page$/) do
  visit new_user_path
end

Given(/^I have a User with nome "(.*?)" and email "(.*?)" and documento "(.*?)" and telefone "(.*?)" and password "(.*?)" and password_confirmation "(.*?)" and admin false$/) do |nome, email, documento, telefone, password, password_confirmation|
  User.create(nome: nome, email: email, documento: documento, telefone: telefone, password: password, password_confirmation: password_confirmation, admin: false)
end

Given(/^I have a valid user with name (.*?)$/) do |name|
  User.create!(nome: name, email: "email@mail.com", documento: 1111111, telefone: 11111111, password: 11111111, password_confirmation: 11111111, admin: false)
end

Given(/^I am at the login page$/) do
  visit login_path
end

Given(/^I am at my home page$/) do
  steps %Q{
    Given I have a valid user with name Rafael 
  }
  visit user_path(id: User.find_by_nome("Rafael")) 
end

Then(/^I should see a confirmation window$/) do
  steps %Q{
    Then I should see "Esta certo de que quer abandonar seu armario?" 
  }
  
end

Then(/^I should be at my home page$/) do
  steps %Q{
    Then I should see "Requerir Armario" 
  }
  
end

Then(/^I should not see "(.*?)"$/) do |arg1|
  expect(page).not_to have_content(text)
end
