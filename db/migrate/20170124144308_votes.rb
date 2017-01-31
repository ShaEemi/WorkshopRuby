class Votes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.datetime :vo_date
      t.belongs_to :electeurs, index: true
      t.belongs_to :bogestionelections, index: true
      t.belongs_to :candidats, index: true

    t.timestamps
    end
  end
end