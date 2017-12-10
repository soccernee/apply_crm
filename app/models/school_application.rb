class SchoolApplication < ApplicationRecord
  #
  # This represents a single school belonging to an ApplicationCycle (Board)
  #
  belongs_to :application_cycle
  has_one :school

  validates :school_id, :application_cycle_id, presence: true
end
