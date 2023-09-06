class SportSession < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  belongs_to :sport_category
  has_one :chatroom, dependent: :destroy
  has_many :attendees, dependent: :destroy
  has_many :participants, through: :attendees, source: :user

  validate :start_time_must_be_before_end_time
  validate :start_time_in_future

  enum skill_level: %i[beginner intermediate advanced]

  private

  def start_time_must_be_before_end_time
    if start_time.present? && end_time.present? && start_time >= end_time
      errors.add(:start_time, "must be before the end date")
    end
  end

  def start_time_in_future
    if start_time.present? && start_time <= Time.now
      errors.add(:start_time, "must be in the future")
    end
  end
end
