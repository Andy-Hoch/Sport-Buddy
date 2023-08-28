class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
  has_many :my_events, class_name: "SportSession"

  has_many :attendees
  has_many :attendings, through: :attendees, source: :sport_session

  validates :first_name, presence: true
  validates :last_name, presence: true
end
