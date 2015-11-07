Feature: User Login
	In order to access my information
  As a registred user
  I want to be able to login using my email and password

  Background: user has been add to the database
    Given the following user exists:
      | nome    | email             | documento   | telefone  | password  | password_confirmation | admin | 
      | Cliente | cliente@gmail.com | 1234        | 987654321 | 123456    | 123456                | false |

  Scenario: with valid fields
    Given  I am at the login page
    When I fill the "Email" field with "cliente@gmail.com"
    And I fill the "Senha" field with "123456"
    When I press the "Mostrar Usuário" button
    Then I should see "Cliente"

  Scenario: without valid fields
    Given I am at the login page
    When I press the "Mostrar Usuário" button
    Then I should see "Combinacao email/senha invalida"