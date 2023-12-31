class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
  has_many :my_events, class_name: "SportSession", dependent: :destroy

  has_many :attendees
  has_many :events, through: :attendees, source: :sport_session, dependent: :destroy

  has_one_attached :photo
  enum sex: %i[male female undefined]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :sex, presence: true
  validates :birth_date, presence: true
  validates :photo, presence: true
end
