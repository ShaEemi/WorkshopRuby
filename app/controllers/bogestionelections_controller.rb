class BogestionelectionsController < ApplicationController
 def index
     @page_title = "Toutes les élections"
     @bogestionelections = Bogestionelection.all
   end

     def new
        @page_title = "Ajouter une élection"
        @candidats = Candidat.all
        @bopartis = Boparti.all
     end

    def create
        @bogestionelection = Bogestionelection.new(bogestionelection_params)

        @bogestionelection.save

        @result = Bogestionelection.maximum("id")

        @candidats_id = params[:candidats_id]

        @candidats_id.each do |candidat|
            @competiteur = Competiteur.create(:candidats_id => candidat, :bogestionelections_id => @result)
            @competiteur.save
        end

        flash[:notice] = 'L\'élection a bien été créée'
        flash[:color]  = "success"

        redirect_to bogestionelections_path
    end

private
  def bogestionelection_params
    params.require(:bogestionelection).permit(:el_titre , :el_descr, :el_date_debut, :el_date_fin )
  end

end

