Fabricator(:goal) do
  title1 { 'Custom' }
  title2 { Faker::Lorem.words.join(' ') }
  frequency { 'per day' }
  unit { 'hours' }
  quantity { '5' }
end