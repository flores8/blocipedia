class Wiki < ActiveRecord::Base
	# Associations
  belongs_to :user
  has_many :pages, dependent: :destroy

  default_scope { order('created_at DESC') }

  # Validations
  validates :name, presence: true
end
