Feature: User Creation
  In order to create a user
  As a client
  I want to be able to create new User

  Scenario: with valid fields
    Given I am at the user creation page
    When I fill the "Nome" field with "Cliente"
    And I fill the "Email" field with "cliente@email.com"
    And I fill the "Número USP" field with "1234"
    And I fill the "Telefone" field with "987654321"
    And I fill the "Senha" field with "123456"
    And I fill the "Confirmar senha" field with "123456"
    And I press the "Criar usuário" button
    Then I should see "Usuário criado com sucesso."

  Scenario: without valid fields
    Given I am at the user creation page
    When I press the "Criar usuário" button
    Then I should see "{:nome=>["can't be blank"], :email=>["can't be blank", "is invalid"], :password=>["can't be blank", "is too short (minimum is 6 characters)"], :documento=>["can't be blank"], :telefone=>["can't be blank"], :password_digest=>["can't be blank"]}"