class SessionsController < ApplicationController
	def new
        @page_title = "Connexion !"
	end
	def create
	  electeur = Electeur.find_by(ut_email: params[:session][:ut_email])

        if electeur
	        electeur_mdp = electeur[:password_digest]
	        connexion_mdp = Digest::SHA1.hexdigest(params[:session][:password_digest])
	        if electeur_mdp == connexion_mdp
	            session[:id] = electeur.id
                session[:ut_statut] = electeur.ut_statut
		        flash[:notice] = 'Vous êtes connecté !'
                flash[:color]  = "success"
                redirect_to actualites_path

	        else
	            flash[:notice] = 'Mot de passe et/ou email invalide(s)'
                flash[:color]  = "danger"
      	        redirect_to connexion_path
	        end
         else
            flash[:notice] = 'Mot de passe et/ou email invalide(s)'
            flash[:color]  = "danger"
            redirect_to connexion_path
        end
	end
	def destroy 
	  	session[:id] = nil
        flash[:notice] = 'Vous êtes déconnecté !'
        flash[:color]  = "success"
	  	redirect_to connexion_path
	end
end
