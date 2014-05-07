class PagePolicy < ApplicationPolicy

	def show?
		#binding.pry
		collaborator = @user.collaborators.where(wiki_id: @record.id).first
		owner = @user.collaborators.where(user_id: @user.id, wiki_id: @record.id).first
		if collaborator.present?
			collaborator.role = "owner" ? true : false
			collaborator.role = "collaborator" ? true : false
		else
			false
		end
	end
end