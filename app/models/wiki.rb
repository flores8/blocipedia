class Wiki < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: [:slugged, :history]

	# Associations
	has_many :collaborators
	belongs_to :user
  has_many :users, through: :collaborators
  has_many :pages, dependent: :destroy


  default_scope { order('created_at DESC') }
  #scope :private, -> { where(private: true) }

  # Validations
  validates :name, presence: true
  validates_associated :users, uniqueness: true
end

# call-back when wiki is created to make owner the owner/collaborator
#def make_owner_collaborator
#  owner_collaborator = Collaborator.build(self, self.user)
#  owner_collaborator.save
#end