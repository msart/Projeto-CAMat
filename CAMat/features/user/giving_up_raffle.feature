Feature: User giving up his/her inscription for the raffle
	In order to given up my inscription for the raffle
  As user
  I want to be able to cancel my inscription for the raffle

  Background: user has been add to the database
    Given the following user exists:
      | nome    | email             | documento   | telefone  | password  | password_confirmation | admin | 
      | Cliente | cliente@gmail.com | 1234        | 987654321 | 123456    | 123456                | false |  

  Scenario: while I am subscripted
    Given I am at my home page
    When I press the "Abandonar inscrição" button
    Then I should see a confirmation window
    When I press the confirmation button
    Then I should be at my home page
    And I should see "Você abandonou o sorteio"
    And I should see "Inscrever-me"

  Scenario: while I am not subscripted
    Given I am at my home page
    Then I should see "Inscrever-me"