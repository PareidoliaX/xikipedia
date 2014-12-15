require 'faker'

# Create Filler Users
10.times do
  user = User.new(
    first_name:    Faker::Name.first_name,
    last_name:     Faker::Name.last_name,
    email:         Faker::Internet.email,
    password:      Faker::Internet.password(10,15)
  )
  user.skip_confirmation!
  user.save!
end


# Create Admin User
admin = User.new(
  first_name:   'Admin',
  last_name:    "User",
  email:        'admin@example.com',
  password:     'helloworld',
  role:         'admin'
)
admin.skip_confirmation!
admin.save!

# Create Diagnostic User
diagnostic = User.new(
  first_name:   'Diagnostic',
  last_name:    "User",
  email:        'diagnostic@example.com',
  password:     'helloworld',
  role:         'diagnostic'
)
diagnostic.skip_confirmation!
diagnostic.save!

# Create Premium User
premium = User.new(
  first_name:   'Premium',
  last_name:    "User",
  email:        'premium@example.com',
  password:     'helloworld',
  role:         'premium'
)
premium.skip_confirmation!
premium.save!

# Create Free User
basic = User.new(
  first_name:   'Basic',
  last_name:    "User",
  email:        'basic@example.com',
  password:     'helloworld',
  role:         'basic'
)
basic.skip_confirmation!
basic.save!

users = User.all
puts "User Emails: #{users.pluck :email}"

#Report
puts "#{users.count} users created."