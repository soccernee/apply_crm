class School < ApplicationRecord
  validates :name, :city, :state, :country, presence: true
  validate :location

  #
  # PG Search for Typeahead
  #
  include PgSearch
  pg_search_scope :search_by_name,
    against: [
      [:name, 'A'],
      [:state, 'B'],
      [:city, 'C'],
    ],
    using: {
      tsearch: {prefix: true}
    }


  #
  # Validations
  #
  def location
    current_country = ISO3166::Country[country]
    if current_country
      errors.add(:state, "incorrect state for country #{current_country.name}.") unless current_country.states.keys.include?(state)
    else
      errors.add(:country, "must be a 2 character country representation (ISO 3166-1).")
    end
  end
end
