FactoryBot.define do
  factory :comment do
    commenter "サンプルコメンター"
    comment "サンプルコメント"
    association :post
  end
end
