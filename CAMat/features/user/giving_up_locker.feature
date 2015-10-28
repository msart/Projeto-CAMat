Feature: User fiving up his locker
  In order to free my locker that i dont use anymore
  As a client
  I want to be able to give up my locker

  Scenario: While I have a locker
    Given I am at the my home page
    When I press "Abandonar Armário"
    Then I should see a confirmation windown
    When I press the confirm button
    Then I should be at my home page
    And I should see "Você abandonou seu armário"
    And I should see "Armário:-"

  Scenario: While I have no locker
    Given I am at the my home page
    Then I should not see "Abandonar Armário"
    
