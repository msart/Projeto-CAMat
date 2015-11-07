Feature: Admin starting raffle subscription period
	In order to permmit comum users subscript to the next raffle
  As a admin user
  I want to be able to open subscription period

  Background: user has been add to the database
    Given the following user exists:
      | nome    | email             | documento   | telefone  | password  | password_confirmation | admin | 
      | Cliente | cliente@gmail.com | 1234        | 987654321 | 123456    | 123456                | true  |

  Scenario: while outside subscription period
    Given I am at my home page
    When I press the "Começar inscrição para sorteio" button
    Then I should be at the "Configuração de Sorteio" page
    When I fill the "Início das inscrições" field with "01/01/2016"
    And I fill the "Fim das incrições" field with "01/02/2016"
    And I press "Começar Inscrições"
    Then I should see a confirmation window
    When I press the confirmation button
    Then I should be at my home page
    And I should see "Inscrições começam no dia 01/01/2016. O sorteio será no dia 01/02/2016"