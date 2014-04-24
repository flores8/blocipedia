class Wiki < ActiveRecord::Base
	# Associations
  belongs_to :user

  # Validations
  validates :name, presence: true
end
