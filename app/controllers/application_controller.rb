class ApplicationController < ActionController::Base
	include Pundit

	rescue_from Pundit::NotAuuthorizedError, with: :not_authorized

	private

	def not_authorized
		redirect_to root_path, alert: "ACCESS DENIED."
	end	

end
