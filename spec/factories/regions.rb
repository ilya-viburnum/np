FactoryBot.define do
  factory :region do
    sequence(:name) { "Region #{_1}" }
  end
end
