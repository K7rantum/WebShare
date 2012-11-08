FactoryGirl.define do
  factory :user do |u|
    u.sequence(:email) { |n| "factoryUser#{n}@Gmail.com" }
    u.sequence(:username) { |n| "factoryUser#{n}" }
    u.password "factoryUser"
    u.password_confirmation "factoryUser"
  end
end