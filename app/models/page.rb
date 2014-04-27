class Page < ActiveRecord::Base
  belongs_to :wiki
  belongs_to :user

  default_scope { order('created_at DESC') }

  # Validations
  validates :title, presence: true
  validates :body, presence: true
end
