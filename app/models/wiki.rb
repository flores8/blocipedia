class Wiki < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: [:slugged, :history]

	# Associations
	has_many :collaborators
	belongs_to :user, dependent: :destroy
  has_many :users, through: :collaborators
  has_many :pages, dependent: :destroy


  default_scope { order('created_at DESC') }

  # Validations
  validates :name, presence: true
end
