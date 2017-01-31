class ResultatsController < ApplicationController

    def index
          @page_title = "Tous les résultats"
          @candidats = Candidat.all
          @competiteurs = Competiteur.all
          @bopartis = Boparti.all
          @separatevote = Array.new;
          @allvotes = Vote.all

          @candidats.each do |candidat|

            @request = "candidats_id".concat(" = ").concat(candidat.id.to_s)
            @vote = @allvotes.distinct.where(@request)
            @vote = @vote.distinct.count('id')
            @separatevote.push(@vote)

          end

            @separatevote.delete(0)

            @i = 0
            @separatevote.each do |separate|
                @i = @i+separate
            end

            @percentagevotes = Array.new;
             @separatevote.each do |separate|
                @o = (separate.to_f/@i.to_f)*100
                @percentagevotes.push(@o)
            end
    end

end
