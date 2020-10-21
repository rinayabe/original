FactoryBot.define do
  factory :donation do
    token                { 'aaa' }
    price                { '100' }
    user_id              { '5' }
    matter_id            { '5' }
  end
end