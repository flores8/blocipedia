class WikiPolicy < ApplicationPolicy
	def index
	end

	def show?
		#binding.pry
		if user.present?
			collaborator = @user.collaborators.where(wiki_id: @record.id).first
			owner = @user.collaborators.where(user_id: @user.id, wiki_id: @record.id).first
			if collaborator.present?
				collaborator.role = "owner" ? true : false
				collaborator.role = "collaborator" ? true : false
			else
				false
			end
		else
			false
		end
	end

	def create
		user.present?
	end

	def new
		create?
	end

	def edit
		show?
	end

	def update
		show? 
	end

	def destroy 
		collaborator = @user.collaborators.where(wiki_id: @record.id).first
		owner = @user.collaborators.where(user_id: @user.id, wiki_id: @record.id).first
		if collaborator.present?
			collaborator.role = "owner" ? true : false
		else
			false
		end
	end
end


