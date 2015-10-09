FactoryGirl.define do
  factory :account do |a|
    a.expire_date {}
    a.locker  {"C07"}
    a.user {"Pedro Marcondes"}
  end
end