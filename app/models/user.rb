class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Associations
  has_many :collaborators
  has_many :wikis
  has_many :pages, dependent: :destroy

  def role?(base_role)
  	role == base_role.to_s
  end

end
