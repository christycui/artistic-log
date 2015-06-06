Fabricator(:entry) do
  date { Faker::Date.forward }
  status { ['Yes', 'No', 'Somewhere in between'].sample }
  quantity { Faker::Number.digit }
  content { Faker::Lorem.paragraphs.join(" \n") }
end