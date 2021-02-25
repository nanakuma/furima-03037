FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {Faker::Internet.free_email}
    password              {"a000000"}
    password_confirmation {password}
    firstname_kanji       {"熊田"}
    lastname_kanji        {"陽平"}
    firstname_kana        {"クマダ"}
    lastname_kana         {"ヨウヘイ"}
    birth                 {"2020-01-01"}

    

  end
end