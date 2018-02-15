#
# DB Seed file
#

require 'faker'
magnitude = 100


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

Employee.create(
  email: 'e@e.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Employee',
  last_name: 'User',
  username: 'employee_user',
  address: '123 Fake St.',
  phone_number: '123-456-7890',
  availability: 'Weeknights after 6pm',
  info: 'Boring',
)

employee_user_ids = Array.new
for i in 0..magnitude
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
    info: Faker::Seinfeld.quote,
  )
  employee_user_ids << employee.id
end

Client.create(
  email: 'c@c.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Client',
  last_name: 'User',
  username: 'client_user',
  address: '789 Something Drive',
  phone_number: '999-111-2222',
)

client_user_ids = Array.new
for i in 0..magnitude
  client = Client.create(
    email: Faker::Internet.free_email,
    password: 'password',
    password_confirmation: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name(4..10),
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    info: Faker::TheFreshPrinceOfBelAir.quote,
  )
  client_user_ids << client.id
end



#
# Create job requests
#

job_request_ids = Array.new
Faker::Config.locale = 'en-CA'
for i in 0..magnitude
  job_request = JobRequest.create(
    client_id: client_user_ids.sample,
    address: Faker::Address.street_address,
    possible_times: Faker::Date.between(Date.today, 60.days.from_now),
    description: Faker::MostInterestingManInTheWorld.quote,
    quantity_hours: Faker::Number.between(1, 8),
    interview_requested: Faker::Boolean.boolean(0.2),
    possible_interview_times: Faker::Date.between(Date.today, 14.days.from_now),
    interview_notes: Faker::Friends.quote,
    guest_first_name: Faker::Name.first_name,
    guest_last_name: Faker::Name.last_name,
    guest_phone_number: Faker::PhoneNumber.phone_number,
    guest_email: Faker::Internet.free_email,
    guest_preferred_contact: "email",
  )
  job_request_ids << job_request.id
end



#
# Create jobs (no, I'm not a politician)
#

for i in 0..(magnitude * 100)
  Job.create(
    job_request_id: job_request_ids.sample,
    employee_id: employee_user_ids.sample,
    confirmed_time: Faker::Time.between(Date.today, 60.days.from_now, :all),
    # time_work_started: Faker::Time.between(7.days.from_now, 60.days.from_now, :all),
    # time_work_completed: Faker::Time.between(7.days.from_now, 60.days.from_now, :all),
    is_paid: Faker::Boolean.boolean(0.5),
    admin_notes: Faker::HitchhikersGuideToTheGalaxy.quote,
    employee_notes: Faker::HitchhikersGuideToTheGalaxy.marvin_quote,
    address: Faker::Address.street_address,
    description: Faker::MostInterestingManInTheWorld.quote,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.free_email,
  )
end
