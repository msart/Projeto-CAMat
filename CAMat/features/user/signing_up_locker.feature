Feature: User signing up for a locker
	In order to compete for a locker
  As a user
  I want to be able to inscript for a raffle
  
  Background: user has been add to the database
    Given the following user exists:
      | nome    | email             | documento   | telefone  | password  | password_confirmation | admin | 
      | Cliente | cliente@gmail.com | 1234        | 987654321 | 123456    | 123456                | false |
    Given the following locker exists:
      | code    | owner   |
      | z-10    | Cliente |
  
  Scenario: during inscription period
    Given I am at my home page
    When I press the "Inscrever-me" button
    Then I should be at my home page
    And I should see "Você se inscreveu com sucesso"
    And I should see "Data do sorteio:"

  Scenario: outside inscription period
    Given I am at my home page
    Then I should see "Requerir Armário"