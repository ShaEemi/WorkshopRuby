class CandidatsController < ApplicationController

 def index
     @page_title = "Tous les candidats"
     @candidats = Candidat.all
     @bopartis = Boparti.all
   end

	def show
    	@candidat = Candidat.find(params[:id])
        @page_title = @candidat.ca_prenom + " " + @candidat.ca_nom
		@bopartis = Boparti.all		
  	end

	def new
        @page_title = "Ajouter un candidat"
		@bopartis = Boparti.all
	end

	def create
  		@candidat = Candidat.new(candidat_params)

  		if @candidat.save
            flash[:notice] = 'Le candidat a bien été créé'
            flash[:color]  = "success"
  			redirect_to @candidat
		else 
			redirect_to new_candidat_path
		end

	end
 
	private
  		def candidat_params
    		params.require(:candidat).permit(:ca_nom, :ca_prenom, :ca_photo, :ca_program, :ca_program_pdf, :ca_accroche, :bopartis_id)
	    end

end

# rails generate model Candidat ca_nom:string ca_prenom:string ca_photo:text ca_program:text ca_program_pdf:text ca_accroche:text
