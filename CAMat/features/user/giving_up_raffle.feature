Feature: User giving up his/her inscription for the raffle
	In order to given up my inscription for the raffle
  As user
  I want to be able to cancel my inscription for the raffle

  Scenario: while I am subscripted
    Given I am logged as a user
    And I am at my home page
    When I press "Abandonar inscrição" button
    Then I should see a confirmation window
    When I press the confirm button
    Then I should be at my home page
    And I should see "Você abandonou o sorteio"
    And I should see "Inscrever-me"

  Scenario: while I am not subscripted
    Given I am logged as a user
    And I am at my home page
    Then I should see "Inscrever-me"