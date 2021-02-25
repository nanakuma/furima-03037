FactoryBot.define do
  factory :credit do

    token {"pk_test_685d0363801a7250d76178c4"}

    post_num                {"123-4567"}
    shipping_area_id        {2}
    municipalities          {"あ市"}
    addresses               {"い番地"}
    building                {"ビル"}
    tel                     {"09011112222"}

  end
end
