# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user seeds
def make_users_tasks
  flobo = User.create(first_name: "Flobo", last_name: "Fosho", password: "password", password_confirmation: "password", email: "flobo@gmail.com")
  amy = User.create(first_name: "Shady", last_name: "Amy", password: "password", password_confirmation: "password", email: "amy@gmail.com")
  client = Client.create(
    phone_number: Faker::PhoneNumber.phone_number,
    country: Faker::Address.country,
    state: Faker::Address.state,
    postal_code: Faker::Address.postcode,
    city: Faker::Address.city,
    street: Faker::Address.street_address,
    case_id: Faker::Number.number(10),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  task1 = flobo.tasks.create(completed_status: :active, description: "Do laundry", client_id: client.id)
  task2 = flobo.tasks.create(completed_status: :archived, description: "Do lots of homework", client_id: client.id)
end

# client seeds
def make_clients
  1.upto(10) do |n|
    client = Client.create(
      phone_number: Faker::PhoneNumber.phone_number,
      country: Faker::Address.country,
      state: Faker::Address.state,
      postal_code: Faker::Address.postcode,
      city: Faker::Address.city,
      street: Faker::Address.street_address,
      case_id: Faker::Number.number(10),
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    )
  end
end

# comment seeds
def make_comments
  mdo = User.create(id: 3, first_name: "M", last_name: "Do", password: "password", password_confirmation: "password", email: "mdo@gmail.com")
  sigh = Client.create(
    id: 12,
    phone_number: Faker::PhoneNumber.phone_number,
    country: Faker::Address.country,
    state: Faker::Address.state,
    postal_code: Faker::Address.postcode,
    city: Faker::Address.city,
    street: Faker::Address.street_address,
    case_id: Faker::Number.number(10),
    first_name: "Im",
    last_name: "Sad"
  )
  1.upto(5) do |n|
    comment = Comment.create(
      content: Faker::ChuckNorris.fact,
      thread_id: Faker::Number.number(10)
    )
    comment.id = n
    comment.user = mdo
    comment.client = sigh
    comment.save
  end
  6.upto(10) do |n|
    comment = Comment.create(
      user_id: Faker::Number.number(10),
      content: Faker::ChuckNorris.fact,
      thread_id: Faker::Number.number(10),
      client_id: 2
    )
    comment.id = n
    comment.save
  end
end

make_users_tasks
p "Created users"
make_clients
p "Created #{Client.count} clients"
make_comments
p "Created #{Comment.count} comments"
