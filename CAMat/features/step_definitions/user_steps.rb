# -*- encoding : utf-8 -*-
Given(/^I am at the user creation page$/) do
  visit new_user_path
end

Given(/^I am at the login page$/) do
  visit login_path
end

Given(/^I am at the home page$/) do
  visit home_path
end

Then(/^I should see a confirmation window$/) do
  steps %Q{
    Then I should see "Esta certo de que quer abandonar seu armario?"
  }
end

When(/^I press the confirmation button$/) do
  steps %Q{
    Then I press the "Sim" button
  }
end

Then(/^I should be at the "(.*?)" page$/) do |arg1|
  steps %Q{
    Then I should see "#{arg1}"
  }
end

Then(/^I should be at my home page$/) do
  steps %Q{
    Then I should see "Cliente"
  }
end

Then(/^I should be at the user list page$/) do
  steps %Q{
    Then I should see "Índice de Usuários"
  }
end
Then(/^I should not see "(.*?)"$/) do |arg1|
  page.should_not have_content(arg1)
end

Given(/^I have a valid User named "(.*?)"$/) do |name|
  User.create(nome: name, email: "email@mail.com", documento: "1234567", telefone: "12345678", password: "123456", password_confirmation: "123456", admin: false)
end

Given(/^I have an Admin with nome "(.*?)" and email "(.*?)" and documento "(.*?)" and telefone "(.*?)" and password "(.*?)"$/) do |nome, email, documento, telefone, password|
  User.create(nome: nome, email: email, documento: documento, telefone: telefone, password: password, password_confirmation: password, admin: true)
end

Given(/^I am logged in as an Admin$/) do
  steps %Q{
    Given I have an Admin with nome "admin" and email "admin@camat.com" and documento "1212121" and telefone "12121212" and password "senhaadmin"
    Given I am at the home page
  }
  fill_in "_Usuário / Email", :with => "admin@camat.com"
  fill_in "_Senha", :with => "senhaadmin"
  click_button "Entrar"
  visit user_path(User.find_by_email("admin@camat.com"))
end


Given (/^the following user exists:$/) do |user_table|
  user_table.hashes.each do |user|
    User.create(user)
  end
end

Given (/^the following locker exists:$/) do |locker_table|
  locker_table.hashes.each do |locker|
    Locker.create(locker)
  end
end


Given (/^the following feed exists:$/) do |feed_table|
  feed_table.hashes.each do |feed|
    Feed.create(feed)
  end
end

Given (/^I am subscribed to the raffle$/) do
  steps %Q{
    Given I am logged in as an User
    When I click the "INSCREVER-SE" link
  }
end

Given(/^I am logged in as an User$/) do
  steps %Q{
    Given I am at the home page
  }
  fill_in "_Usuário / Email", :with => "cliente@gmail.com"
  fill_in "_Senha", :with => "123456"
  click_button "Entrar"
  visit user_path(User.find_by_email("cliente@gmail.com"))
end
When (/^I accept the confirmation window$/) do
  page.driver.browser.switch_to.alert.accept
end
Given (/^I have a locker$/) do
  Account.create(user: "Cliente", locker: "z-10")
end

Given (/^I am at my home page$/) do
  @user = User.find_by_email('cliente@gmail.com')
  visit user_path(@user)
end

Then(/^I should be at the edit feed page$/) do
  steps %Q{
    Then I should see "Mensagem"
  }
end

