class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :restaurant
  has_many :booking_participations
  has_many :simple_bookings

  def user_bookings(status = nil)
    case status
    when 'ongoing'
      SimpleBooking.where('simple_bookings.date > ? OR simple_bookings.date = ? AND simple_bookings.time > ?', Date.today, Date.today, Time.now)
    when 'over'
      SimpleBooking.where('simple_bookings.date < ? OR simple_bookings.date = ? AND simple_bookings.time < ?', Date.today, Date.today, Time.now)
    else
      SimpleBooking.where(user_id: self)
    end
  end
end
