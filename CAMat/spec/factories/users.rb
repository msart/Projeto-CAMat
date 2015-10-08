FactoryGirl.define do
  factory :userAdmin do |u|
    u.nome { Faker::Name.name }
    u.password{ Faker::Base.bothify}
    
    u.email { Faker::Internet.email }
    u.documento{ Faker::Number.number } 
    u.telefone { Faker::Number.number }   

    u.admin = TRUE
  end
  
    factory :userNormal do |u|
    u.nome { Faker::Name.name }
    u.password{ Faker::Base.bothify}
    
    u.email { Faker::Internet.email }
    u.documento{ Faker::Number.number } 
    u.telefone { Faker::Number.number }   

    u.admin = FALSE
  end
  
end