Factory.define :project do |f|
  f.name "Ticketee" 
end

Factory.define :ticket do |f|
  f.title "MyString"
  f.description "MyTest"
  f.project
end

# FactoryGirl.define do
#   factory :project do
#     name "Ticketee"
#   end
# end

