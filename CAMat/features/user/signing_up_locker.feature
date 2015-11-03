Feature: User signing up for a locker
	In order to compete for a locker
  As a user
  I want to be able to inscript for a raffle

  Scenario: during inscription period
   	Given I am logged as a user
    And I am at my home page
    When I press "Inscrever-me" button
    Then I should be at my home page
    And I should see "Você se inscreveu com sucesso"
    And I should see "Data do sorteio:"

  Scenario: outside inscription period
    Given I am logged as a user
    And I am at my home page
    Then I should see "Requerir Armário"