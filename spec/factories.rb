FactoryGirl.define do
  factory :user do
    username "factoryUser"
    email    "factoryUser@email.com"
    password "factoryUser"
    password_confirmation "factoryUser"
  end
end
