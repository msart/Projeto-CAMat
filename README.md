# Projeto - Engenharia de Software

## Gerenciamento dos Armários do CAMat

### Background
Como conversamos, este projeto começou durante a disciplina de Laboratório de Programação II, ministrada ano passado pelo professor Fabio Kon.
Dessa forma, estamos usando os conhecimentos obtidos em Engenharia de Software para aprimorar o código que já tinhamos.
Em especial, aplicamos o padrão de projeto Strategy.

### Implementação do Design Pattern
Decidimos utilizar o padrão Strategy para selecionar a forma de cálculo do preço dos armários.
As classes de Strategy foram implementadas no modelo do armário em **app/models/locker.rb**
Para auxiliar a implementação, refatorações foram feitas também nos *controllers* e *views* dos armários.
Finalmente, os casos de testes sobre essas classes foram inseridos em **app/spec/models/locker.rb**.

