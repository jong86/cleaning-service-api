module MailHelper
  extend ActiveSupport::Concern

  def send_bill_in_mail(recipient, uuid)
    # Send mail containing link to bill with pony gem
    require 'pony'
    Pony.mail({
      :to => recipient,
      :via => :smtp,
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => 'vancleaningservicemailer',
        :password             => '66hAMzE$2MPp',
        :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
        :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
      },
      :from => 'vancleaningservicemailer@gmail.com',
      :subject => 'Your VanCleaning bill is ready',
      :html_body => "Thank your for your business.<br/>You may click <a href='http://localhost:8080/billing?uuid=#{uuid}'>here</a> to pay your bill.",
    })
  end
end