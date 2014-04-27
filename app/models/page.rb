class Page < ActiveRecord::Base
  belongs_to :wiki
  belongs_to :user

  # Validations
  validates :title, presence: true
  validates :body, presence: true
end
