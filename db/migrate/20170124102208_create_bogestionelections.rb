class CreateBogestionelections < ActiveRecord::Migration[5.0]
  def change
    create_table :bogestionelections do |t|
      t.string :el_titre
      t.text :el_descr
      t.datetime :el_date_debut, :null => false, :default => Time.now
      t.datetime :el_date_fin, :null => false, :default => Time.now    

      t.timestamps
    end
  end
end
