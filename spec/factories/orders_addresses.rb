FactoryBot.define do
  factory :order_address do
    post_code          {"111-1111"}
    area_id            {2}
    municipalities     {"あ"}
    address            {"あ"}
    building_name      {"あ"}
    phone_number       {12345678901}
    token              {"tok_abcdefghijk00000000000000000"}
  end
end