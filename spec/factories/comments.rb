FactoryBot.define do
  factory :comment do
    commenter "MyString"
    comment "MyText"
    post nil
  end
end
