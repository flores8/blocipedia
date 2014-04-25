class Wiki < ActiveRecord::Base
	# Associations
  belongs_to :user
  has_many :pages, dependent: :destroy

  # Validations
  validates :name, presence: true
end
