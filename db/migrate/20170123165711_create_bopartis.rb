class CreateBopartis < ActiveRecord::Migration[5.0]
  def change
    create_table :bopartis do |t|
      t.string :pa_nom
      t.string :pa_sigle
      t.timestamps
    end
  end
end
