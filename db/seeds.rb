# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Employee.create(
  name: 'Fake Person',
  address: '123 Fake St.',
  phone_number: '123-456-7890',
  email: 'fake@fake.fake',
)

Client.create(
  name: 'Fake Client',
  phone_number: '999-111-2222',
  email: 'a@a.a',
)

JobRequest.create(
  client_id: 1,
  address: '456 Sample Ave.',
  possible_times: '4-5 Saturdays',
  description: 'Clean my kitchen please',
)

Job.create(
  job_request_id: 1,
  employee_id: 1,
  confirmed_time: '09/11/18 12:30',
  time_work_started: '09/11/18 12:31',
  time_work_completed: '09/11/18 15:44',
  is_paid: 'false',
)
