# Factory.define :project do |f|
#   f.name "Ticketee" 
# end

# Factory.define :ticket do |f|
#   f.title "MyString"
#   f.description "MyTest"
#   f.project
# end

# Factory.define :user do |f|
#   f.email "user@ticketee.com"
#   f.password "password"
# end

FactoryGirl.define do

  factory :project do
    name "Ticketee"
  end

  factory :ticket do
    title "First Ticket"
    description "This is a ticket"
    # project
  end

  factory :user do
    email "user@ticketee.com"
    password "password"
    password_confirmation "password"
    # confirmed_at Time.nw
    # after(:build) { |user| generate_hashed_password(user) }
    after(:create ) { |user| user.confirm! }
  end

  factory :admin, :class => User do
    email "admin@ticketee.com"
    password "password"
    password_confirmation "password"
    after(:create ) { |user| user.confirm! }
    admin true
  end

end

