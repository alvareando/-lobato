class SimpleBooking < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  validates :name, presence: true
  validates :last_name, presence: true
  validates :time, presence: true
  validates :date, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :people, presence: true
  after_create :send_booking_email

  private
  def send_booking_email
    SimpleBookingMailer.restaurant_new_booking(self.user, self).deliver_now
    SimpleBookingMailer.client_booking_details(self).deliver_now
  end
end
