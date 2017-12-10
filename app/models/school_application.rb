class SchoolApplication < ApplicationRecord
  belongs_to :application_cycle
  has_one :school
end
