FactoryBot.define do
  factory :post do
    title "サンプルタイトル"
    content "サンプル内容"
    status  "published"
    association :user
    postimage Rack::Test::UploadedFile.new(File.join(Rails.root, "test/image/sampleimage.jpg"))
  end
end
