# -*- encoding : utf-8 -*-
FactoryGirl.define do

  factory :user do |u|
    
    u.sequence(:nome) { |n| ["Pedro Marcondes", "Felipe Moreira"] [n%2]  }
    u.password { "abc123"}
    u.password_confirmation { "abc123"}
    
    u.sequence(:email) { |n| "#{n}emailPedro@site.com.br" }
    u.sequence(:documento){|n| "#{n}8564712" } 
    u.telefone { "11147820" }   
    u.sequence(:admin){ |n| [false, true][n%2] }
    
  end

end
