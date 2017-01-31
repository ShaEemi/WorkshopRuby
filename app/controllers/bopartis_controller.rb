class BopartisController < ApplicationController

 def index
     @page_title = "Tous les partis"
     @bopartis = Boparti.all
   end

     def new
        @page_title = "Ajouter un parti politique"
     end

    def create

        @boparti = Boparti.new(boparti_params)

        @boparti.save
        flash[:notice] = 'Le parti a bien été créé'
        flash[:color]  = "success"
        redirect_to bopartis_path
    end

private
  def boparti_params
    params.require(:boparti).permit(:pa_nom , :pa_sigle )
  end
end
