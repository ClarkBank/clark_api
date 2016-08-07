FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@mail.com"
  end

  factory :user do
    email
    password '12345678'

    transient do
      roles_count 1
    end

    factory :user_with_admin_role do
      after(:create) do |user, evaluator|
        create_list(:role, evaluator.roles_count, users: [user])
      end
    end

    factory :user_with_user_role do
      after(:create) do |user, evaluator|
        create_list(:role, evaluator.roles_count, name: 'user', users: [user])
      end
    end

    factory :user_with_guest_role do
      after(:create) do |user, evaluator|
        create_list(:role, evaluator.roles_count, name: 'guest', users: [user])
      end
    end
  end
end
