Feature: User signing up for a locker
	In order to compete for a locker
  As an user
  I want to be able to subscribe for a raffle
  
  Background: user has been add to the database
    Given the following user exists:
      | nome    | email             | documento   | telefone  | password  | password_confirmation | admin | 
      | Cliente | cliente@gmail.com | 1234        | 987654321 | 123456    | 123456                | false |
    Given the following locker exists:
      | code    | owner   |
      | z-10    | Cliente |
  
  Scenario: during subscription period
    Given I am logged in as an User
    When I click the "INSCREVER-SE" link
    Then I should be at my home page
    And I should see "Você se inscreveu no sorteio."

  Scenario: outside subscription period
    Given I am logged in as an User
    Then I should see "REQUERIR ARMÁRIO"