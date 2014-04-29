class Page < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: [:slugged, :history]

  belongs_to :wiki
  belongs_to :user

  default_scope { order('updated_at DESC') }

  # Validations
  validates :title, presence: true
  validates :body, presence: true
end
