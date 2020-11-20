FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {"a12345"}
    password_confirmation {password}
    first_name            {Gimei.first.kanji}
    first_name_ruby       {Gimei.first.katakana}
    last_name             {Gimei.last.kanji}
    last_name_ruby        {Gimei.last.katakana}
    birthday              {Faker::Date.backward}
  end
end