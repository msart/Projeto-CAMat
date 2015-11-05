Feature: User giving up his locker
  In order to free my locker, which I won`t use anymore
  As a client
  I want to be able to give up my locker

  Background: user has been add to the database
    Given the following user exists:
      | nome    | email             | documento   | telefone  | password  | password_confirmation | admin | 
      | Cliente | cliente@gmail.com | 1234        | 987654321 | 123456    | 123456                | false |
    Given the following locker exists:
      | code    | owner   |
      | z-10    | Cliente |
    And I am at my home page
    
  Scenario: While I have a locker
    Given I am at my home page
    When I press the "Abandonar Armário" button
    Then I should see a confirmation window
    When I press the "Sim" button
    Then I should be at my home page
    And I should see "Você abandonou seu armário"
    And I should see "Armário:-"

  Scenario: While I have no locker
    Given I am at my home page
    Then I should not see "Abandonar Armário"
    
