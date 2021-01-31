FactoryBot.define do
  factory :item do
    name                      {"ペン"}
    explanation               {"よくかける"}
    category_id               {"レディース"}
    state_id                  {"新品、未使用"}
    delivery_cost_id          {"送料込み(出品者負担)"}
    shipping_are_id           {"北海道"}
    shipping_days_id          {"1~2日で発送"}
    price                     {"300"}
    
    association :user
  end
end
