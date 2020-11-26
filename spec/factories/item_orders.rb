FactoryBot.define do
  factory :item_order do
    postal_code     {"123-4567"}
    prefecture_id   {2}
    municipality    {"名古屋市"}
    address         {"1-1"}
    building_name   {"名古屋ハイツ"}
    phone_number    {"09012345678"}
    token           {"tok_0000000000"}
    user_id         {4}
    item_id         {10}
  end
end
