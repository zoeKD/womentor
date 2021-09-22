class Profile < ActiveRecord::Base
  extend Enumerize

  include HasAvailability
  include HasExpertise
  include HasJobType

  belongs_to :user
  has_one :expectation, dependent: :destroy
  has_one :mentorship_capacity, dependent: :destroy

  # only for seed
  accepts_nested_attributes_for :mentorship_capacity, :expectation

  def self.create_records(user)
    profile = new(user: user)
    profile.expectation = Expectation.new(profile: profile)
    profile.mentorship_capacity = MentorshipCapacity.new(profile: profile)

    profile.save!
  end
end