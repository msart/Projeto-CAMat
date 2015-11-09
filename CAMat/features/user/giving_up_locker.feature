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
    @javascript
    Scenario: While I have a locker
  	Given I have a locker
  	And I am logged in as an User
  	And I have a locker
    When I press the "Abandonar Armário" button
    And I accept the confirmation window
    And I should see "Você abandonou seu armário."
    And I should see "Armário: -"

  Scenario: While I have no locker
    Given I am at my home page
    Then I should not see "Abandonar Armário"
