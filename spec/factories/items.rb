FactoryBot.define do
  factory :item do
    name                      {"ペン"}
    explanation               {"よくかける"}
    category_id               {2}
    state_id                  {2}
    delivery_cost_id          {2}
    shipping_are_id           {2}
    shipping_days_id          {2}
    price                     {300}
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_images.png'), filename: 'test_images.png')
    end

    association :user
  end
end
