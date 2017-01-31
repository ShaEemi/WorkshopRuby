class Candidats < ActiveRecord::Migration[5.0]
  def change

  create_table :candidats do |t|
        t.string :ca_nom
        t.string :ca_prenom
        t.text :ca_photo
        t.text :ca_program
        t.text :ca_program_pdf
        t.text :ca_accroche
        t.belongs_to :bopartis, index: true

        t.timestamps
      end

  end
end
