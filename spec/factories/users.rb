FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {Faker::Name.first_name}
    first_name_ruby       {Gimei.first.katakana}
    last_name             {Faker::Name.last_name}
    last_name_ruby        {Gimei.last.katakana}
    birthday              {Faker::Date.backward}
  end
end