class JobRequest < ApplicationRecord
  validates :address, presence: true
  validates :description, presence: true
  validates :guest_preferred_contact, inclusion: {
    in: %w(email phone),
    message: "is invalid. Preferred contact can only be 'email' or 'phone'"
  }, allow_nil: true

  belongs_to :client, optional: true

  def init
    self.is_active = true
  end
end
