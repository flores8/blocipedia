class Wiki < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: [:slugged, :history]

	# Associations
  belongs_to :user
  has_many :pages, dependent: :destroy

  default_scope { order('created_at DESC') }

  # Validations
  validates :name, presence: true
end
