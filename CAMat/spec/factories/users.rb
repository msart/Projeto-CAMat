FactoryGirl.define do
  factory :user do |u|
    u.nome { "Pedro Marcondes" }
    u.password { "abc123"}
    u.password_confirmation { "abc123"}
    
    u.email { "emailPedro@site.com.br" }
    u.documento{ "8564712" } 
    u.telefone { "11147820" }   

    u.admin true
  end
  
  
  
=begin  
    factory :userNormal do |u|
    u.nome { Faker::Name.name }
    u.password{ Faker::Base.bothify}
    
    u.email { Faker::Internet.email }
    u.documento{ Faker::Number.number } 
    u.telefone { Faker::Number.number }   

    u.admin false
  end
=end
end

