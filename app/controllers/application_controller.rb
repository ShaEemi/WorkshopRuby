class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	def current_user 
	  @current_user ||= Electeur.find(session[:id]) if session[:id] 
	end
	helper_method :current_user 
	def require_user 
	  redirect_to 'connexion' unless current_user 
	end
end
