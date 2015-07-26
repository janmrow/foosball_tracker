FactoryGirl.define do
  factory :player do
    firstname "John"
    lastname "Smith"
    nickname "smithy99"
    avatar { File.new(Rails.root.join('spec/images/1.png')) }
  end
end
