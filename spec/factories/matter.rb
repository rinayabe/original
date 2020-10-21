FactoryBot.define do
  factory :matter do

    name              {"abe"}
    explain           {"あああああああああああああ"}
    price             {"500"}
    user_id           { '5' }
    after(:build) do |matter|
      matter.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'test_image.png')
    end
  end
end