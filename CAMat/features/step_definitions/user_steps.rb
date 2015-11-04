# encoding: utf-8
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

Given(/^I have a User with nome "(.*?)" and email "(.*?)" and documento "(.*?)" and telefone"(.*?)" and password "(.*?)"/) do |nome, email, documento, telefone, password|
  User.create(nome: nome, email: email, documento: documento, telefone: telefone, password: password, password_confirmation: password_confirmation, admin: false)
end

Given(/^I have an Admin with nome "(.*?)" and email "(.*?)" and documento "(.*?)" and telefone "(.*?)" and password "(.*?)"$/) do |nome, email, documento, telefone, password|
  User.create(nome: nome, email: email, documento: documento, telefone: telefone, password: password, password_confirmation: password, admin: true)
end

Given(/^I am logged in as an Admin$/) do
  steps %Q{
    Given I have an Admin with nome "admin" and email "admin@camat.com" and documento "1212121" and telefone "12121212" and password "senhaadmin"
    Given I am at the login page 
  }
  fill_in "Email", :with => "admin@camat.com"
  fill_in "Senha", :with => "senhaadmin"
  click_button "Mostrar Usuário"
  visit user_path(User.find_by_nome("admin"))
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
