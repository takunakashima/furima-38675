FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/IMG_0803.JPG'),filename: 'IMG_0803.JPG')
    end 

    item_name          {Faker::Name.name}
    explain            {Faker::Lorem.sentence}
    category_id        {2}
    status_id          {2}
    delivery_charge_id {2}
    area_id            {2}
    days_required_id   {2}
    price              {300}

  end
end