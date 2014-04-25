class Page < ActiveRecord::Base
  belongs_to :wiki

  # Validations
  validates :title, presence: true
  validates :body, presence: true
end
