class Expectation < ActiveRecord::Base
  extend Enumerize
  
  include HasAvailability
  include HasExpertise
  include HasJobType

  belongs_to :profile
end