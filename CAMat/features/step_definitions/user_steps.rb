Given(/^I am at the user creation page$/) do
  visit new_user_path
end

Given(/^I am at the login page$/) do
  visit login_path
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
Given(/^I have a User with nome "(.*?)" and email "(.*?)" and documento "(.*?)" and telefone"(.*?)" and password "(.*?)" and password_confirmation "(.*?)" and admin true/) do |nome, email, documento, telefone, password, password_confirmation|
  User.create(nome: nome, email: email, documento: documento, telefone: telefone, password: password, password_confirmation: password_confirmation, admin: false)
end


Given (/^the following user exist:$/) do |user_table|
  user_table.hashes.each do |user|
    User.create(user)
  end
end

Given (/^I am at my home page$/) do 
  @user = User.where(nome: 'Cliente', email: 'cliente@gmail.com')
  visit user_path(@user)
end
