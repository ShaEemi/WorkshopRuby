class Electeurs < ActiveRecord::Migration[5.0]
  def change
    create_table :electeurs do |t|
      t.text :ut_nom
      t.text :ut_prenom
      t.date :ut_date_naissance
      t.text :ut_lieu_naissance
      t.text :ut_adresse
      t.integer :ut_postal
      t.text :ut_ville
      t.text :ut_pays
      t.text :ut_email
      t.text :password_digest
      t.text :ut_urlIDR
      t.text :ut_urlIDV
      t.boolean :ut_statut
      t.timestamps
    end
  end
end

