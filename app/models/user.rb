class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :attendee
  belongs_to :messages
  has_many :sport_sessions

  validates :first_name, presence: true
  validates :last_name, presence: true
end
