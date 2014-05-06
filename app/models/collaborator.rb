class Collaborator < ActiveRecord::Base
	belongs_to :wiki
  belongs_to :user

  # Validations

end
