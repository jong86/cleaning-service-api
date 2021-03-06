#
# DB Seed file
#

require 'faker'


#
# Create users
#

Admin.create(
  email: 'a@a.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Admin',
  last_name: 'User',
  username: 'admin_user',
)

bob = Employee.create(
  email: 'fake@employee.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Bob',
  last_name: 'Aliceson',
  username: 'employee_user',
  address: '456 Sample Ave.',
  phone_number: '123-456-7890',
  availability: 'Weeknights after 6pm',
  info: 'Some information here',
)

employee_user_ids = Array.new
employee_user_ids << bob
for i in 0..4
  employee = Employee.create(
    email: Faker::Internet.free_email,
    password: 'password',
    password_confirmation: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name(4..10),
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    availability: ['Weeknights after 6pm', 'Weekdays from 9-5', 'Weekends all day'].sample,
  )
  employee_user_ids << employee.id
end


#
# Create job requests
#

job_request_ids = Array.new
Faker::Config.locale = 'en-CA'
for i in 0..4
  job_request = JobRequest.create(
    address: Faker::Address.street_address,
    possible_times: Faker::Date.between(Date.today, 60.days.from_now),
    description: Faker::MostInterestingManInTheWorld.quote,
    guest_first_name: Faker::Name.first_name,
    guest_last_name: Faker::Name.last_name,
    guest_phone_number: Faker::PhoneNumber.phone_number,
    guest_email: Faker::Internet.free_email,
    guest_preferred_contact: "email",
    is_active: [true, false].sample
  )
  job_request_ids << job_request.id
end



#
# Create jobs (no, I'm not a politician)
#

for i in 0..(3)
  Job.create(
    employee_id: employee_user_ids.sample,
    confirmed_time: Faker::Time.between(Date.today, 60.days.from_now, :all),
    admin_notes: Faker::HitchhikersGuideToTheGalaxy.quote,
    employee_notes: Faker::HitchhikersGuideToTheGalaxy.marvin_quote,
    address: Faker::Address.street_address,
    description: Faker::MostInterestingManInTheWorld.quote,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.free_email,
    customer_first_name: Faker::Name.first_name,
    customer_last_name: Faker::Name.last_name,
  )
end
