Fabricator(:entry) do
  date { Faker::Date.backward(5) }
  status { ['Yes', 'No', 'Somewhere in between'].sample }
  quantity { Faker::Number.digit }
  content { Faker::Lorem.paragraphs.join(" \n") }
end