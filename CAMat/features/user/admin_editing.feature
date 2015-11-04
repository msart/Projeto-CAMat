Feature: Admin editing permission
  In order to edit users information
  As a admin user
  I want to be able to acess and edit users information

  Scenario: access to user list
   	Given I am logged in as an Admin
    When I press the "Voltar aos usuários" button
    Then I should see "Índice de Usuários"
    #terminar

  Scenario: editing a generic user
    Given I have an Admin with nome "Admin" and email "admin@camat.com" and documento "1234" and telefone "1234546" and password "123456"
    And I have a User with nome "Clientenome" and email "cliente@cliente.com" and documento "1234" and telefone "1234546" and password "123456"
    #termne

