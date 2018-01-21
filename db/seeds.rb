#
# DB Seed file
#

require 'faker'

Employee.create(
  email: 'e@e.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Fake',
  last_name: 'Person',
  username: 'fake_person77',
  address: '123 Fake St.',
  phone_number: '123-456-7890',
  availability: 'Weeknights after 6pm',
)

Client.create(
  email: 'c@c.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Another',
  last_name: 'Guy',
  username: 'another_guy88',
  address: '789 Something Drive',
  phone_number: '999-111-2222',
)

Admin.create(
  email: 'a@a.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Admin',
  last_name: 'User',
  username: 'admin_user99',
)

job_request_ids = Array.new
Faker::Config.locale = 'en-CA'
for i in 0..100
  job_request = JobRequest.create(
    client_id: 2,
    address: Faker::Address.street_address,
    possible_times: Faker::Date.between(Date.today, 60.days.from_now),
    work_description: Faker::MostInterestingManInTheWorld.quote,
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


for i in 0..100
  Job.create(
    job_request_id: job_request_ids.sample,
    employee_id: 1,
    confirmed_time: Faker::Time.between(Date.today, 60.days.from_now, :all),
    time_work_started: Faker::Time.between(7.days.from_now, 60.days.from_now, :all),
    time_work_completed: Faker::Time.between(7.days.from_now, 60.days.from_now, :all),
    is_paid: Faker::Boolean.boolean(0.5),
    admin_notes: Faker::HitchhikersGuideToTheGalaxy.quote,
    employee_notes: Faker::HitchhikersGuideToTheGalaxy.marvin_quote,
  )
end

