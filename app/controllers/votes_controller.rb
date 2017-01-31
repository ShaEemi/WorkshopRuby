class VotesController < ApplicationController

    def index
      @page_title = "Choisissez un candidat"
      @candidats = Candidat.all
      @competiteurs = Competiteur.all
      @bopartis = Boparti.all
      @electeur_id = session[:id]
      @votes = Vote.all
      @todaysdate = Date.today.to_s
      @request = "%".concat(@todaysdate).concat("%")
      @bgoelections = Bogestionelection.where('el_date_debut LIKE ?', @request).all

        if @bgoelections.size == 0
            flash[:notice] = 'Il n\'y a pas de vote'
            flash[:color]  = "danger"
            redirect_to actualites_path
        else
            @bgoelections.each do |bgoelection|
                @bgoelectionid = bgoelection.id
                @bgoelectionname = bgoelection.el_titre
                @bgoelectiondescr = bgoelection.el_descr
                @bgoelectiondeb = bgoelection.el_date_debut.strftime("%d/%m/%Y à %I:%M")
                @bgoelectionfin = bgoelection.el_date_fin.strftime("%d/%m/%Y à %H:%M")

               @exist = 0
               @votes.each do |vote|
                   if vote.electeurs_id == @electeur_id and vote.bogestionelections_id == @bgoelectionid
                     @exist = 1
                    end
                end

                if @exist == 1
                   flash[:notice] = 'Vous avez déjà voté pour cette élection !'
                   flash[:color]  = "danger"
                   redirect_to actualites_path
                end
            end
        end

    end

    def new
        @page_title = "Votez !"
        @iduser = Electeur.find(session[:id])
        @vote = params[:idcandidat]
        @bgoelectionid = params[:bgoelectionid]

        if @vote.nil?
            flash[:notice] = 'Vous devez choisir un candidat !'
            flash[:color]  = "danger"
            redirect_to votes_path
        end
        @candidats = Candidat.all
        @bopartis = Boparti.all

    end

    def create
        @electeur_id = session[:id]
        @bgoelectionid = params[:bgoelectionid]
        @todaysdate = Date.today.to_s

        if params[:validate_identite] == "1" and params[:validate_candidat] == "1"

            @candidats_id = params[:candidats_id]
            @vote = Vote.create(:vo_date => @todaysdate, :electeurs_id => @electeur_id, :bogestionelections_id => @bgoelectionid, :candidats_id => @candidats_id)
            @vote.save
            flash[:notice] = 'Votre vote a bien été pris en compte !'
            flash[:color]  = "success"
            redirect_to actualites_path

        elsif params[:validate_identite] == "0" and params[:validate_candidat] == "1"
            flash[:notice] = 'Connectez-vous pour confirmer votre identité'
            flash[:color]  = "danger"
            redirect_to deconnexion_path

        elsif params[:validate_identite] == "1" and params[:validate_candidat] == "0"
            flash[:notice] = 'Choisissez votre candidat'
            flash[:color]  = "danger"
            redirect_to votes_path
        else
            flash[:notice] = 'Connectez-vous pour confirmer votre identité'
            flash[:color]  = "danger"
            redirect_to deconnexion_path
        end
    end
end
