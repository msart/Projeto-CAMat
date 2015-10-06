Feature: User Login
	In order to access my information
  	As a registred user
  	I want to be able to login using my email and password

  	Scenario: with valid fields
    Given I have a User with nome "Clientenome" and email "cliente@cliente.com" and documento "1234" and telefone"1234546" and password "123456" and password_confirmation "123456" and admin false
    And I am at the login page
    When I fill the "Email" field with "cliente@cliente.com"
    And I fill the "Senha" field with "123456"
    When I press the "Mostrar Usuário" button
    Then I should see "Clientenome"

    Scenario: without valid fields
    Given I am at the login page
    When I press the "Mostrar Usuário" button
    Then I should see "Combinacao email/senha invalida"