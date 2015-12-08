Feature: editing feed
  In order to edit the feed
  As a admin user
  I want to be able to edit the message
  
  Background: user has been add to the database
    Given the following user exists:
      | nome    | email             | documento   | telefone  | password  | password_confirmation | admin | 
      | Cliente | cliente@gmail.com | 1234        | 987654321 | 123456    | 123456                | true |  
    Given the following feed exists:
       |msg |
       |'oi'|

  Scenario: editing message
    Given I am logged in as an User
    And I am at my home page
    When I click the "Editar Feed" link
    Then I should be at the edit feed page
    And I press the "Atualizar Mensagem" button
    Then I should see "Mensagem atualizada com sucesso."
