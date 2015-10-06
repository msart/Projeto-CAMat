FactoryGirl.define do
  factory :locker do |l|
    l.owner { Faker::Name.name}
    l.code { Faker::Base.regexify(/^[A-Z]\d{2}$/)}
  end
end