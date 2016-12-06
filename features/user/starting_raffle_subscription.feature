Feature: Admin starting raffle subscription period
  In order to permmit comum users subscript to the next raffle
  As a admin user
  I want to be able to open subscription period

  Background: user has been add to the database
    Given the following user exists:
      | nome    | email             | documento   | telefone  | password  | password_confirmation | admin | 
      | Cliente | cliente@gmail.com | 1234        | 987654321 | 123456    | 123456                | true  |

  Scenario: while outside subscription period
    Given I am logged in as an User
    When I click the "INICIAR PERÍODO DE INSCRIÇÃO" link
    Then I should see "Novo Sorteio"
    When I fill the "Início das Inscrições" field with "01/01/2016"
    And I fill the "Fim das Inscrições" field with "01/02/2016"
    And I press the "Criar Sorteio" button
    Then I should see "Sorteio criado com sucesso."