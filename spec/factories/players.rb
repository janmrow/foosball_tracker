FactoryGirl.define do
  factory :player do
    factory :player1 do
      firstname "John"
      lastname "Smith"
      nickname "smithy99"
      avatar { File.new(Rails.root.join('spec/images/1.png')) }
    end

    factory :player2 do
      firstname "Tom"
      lastname "Marlow"
      nickname "marlowy11"
      avatar { File.new(Rails.root.join('spec/images/1.png')) }
    end
  end
end
