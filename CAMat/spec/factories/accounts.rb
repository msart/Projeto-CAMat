# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :account do |a|
    a.expire_date {"06:03:05 AM"}
    a.locker  {"C07"}
    a.user {"Pedro Marcondes"}
  end
end
