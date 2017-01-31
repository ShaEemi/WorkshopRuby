class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :co_nom
      t.string :co_sujet
      t.text :co_message
      t.string :co_email

      t.timestamps
    end
  end
end
