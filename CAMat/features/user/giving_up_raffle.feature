Feature: User giving up his/her inscription for the raffle
	In order to give up my chance for a locker
  As an user
  I want to be able to cancel my subscription for the raffle

  Background: user has been add to the database
    Given the following user exists:
      | nome    | email             | documento   | telefone  | password  | password_confirmation | admin | 
      | Cliente | cliente@gmail.com | 1234        | 987654321 | 123456    | 123456                | false |  
@javascript
  Scenario: while I am subscripted
    Given I am subscribed to the raffle
    When I press the "Abandonar Inscrição" button
    And I accept the confirmation window
    Then I should be at my home page
    And I should see "Você abandonou o sorteio"