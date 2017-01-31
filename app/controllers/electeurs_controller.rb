class ElecteursController < ApplicationController
	def new
        @page_title = "Inscription"
		@electeur = Electeur.new
	end
	def create
		@password = Digest::SHA1.hexdigest(params[:electeur][:password_digest])
		@electeur = Electeur.create(:ut_nom => params[:electeur][:ut_nom] , :ut_prenom => params[:electeur][:ut_prenom], :ut_date_naissance => params[:electeur][:ut_date_naissance], :ut_lieu_naissance => params[:electeur][:ut_lieu_naissance], :ut_adresse => params[:electeur][:ut_adresse], :ut_postal => params[:electeur][:ut_postal], :ut_ville => params[:electeur][:ut_ville], :ut_pays => params[:electeur][:ut_pays], :ut_email => params[:electeur][:ut_email], :password_digest => @password, :ut_urlIDR => params[:electeur][:ut_urlIDR], :ut_urlIDV => params[:electeur][:ut_urlIDV], :ut_statut => 0)
		if @electeur.save
			session[:ut_id] = @electeur.id
			flash[:notice] = 'Vous êtes inscrit !'
            flash[:color]  = "success"
            redirect_to new_session_path
		else 
			flash[:notice] = 'Une erreur est survenue, veuillez réessayer'
            flash[:color]  = "danger"
            redirect_to inscription_path
		end
	end
end
