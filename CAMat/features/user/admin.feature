Feature: Admin editing permission
	In order to edit users information
  	As a admin user
  	I want to be able to acess and edit users information

  	Scenario: access to user list
   		Given I have a User with nome "Admin" and email "admin@camat.com" and documento "1234" and telefone"1234546" and password "123456" and password_confirmation "123456" and admin true
    	#terminar




    Scenario: editing a generic user
    	Given I have a User with nome "Admin" and email "admin@camat.com" and documento "1234" and telefone"1234546" and password "123456" and password_confirmation "123456" and admin true
    	And I have a User with nome "Clientenome" and email "cliente@cliente.com" and documento "1234" and telefone"1234546" and password "123456" and password_confirmation "123456" and admin false
    	#terminar

