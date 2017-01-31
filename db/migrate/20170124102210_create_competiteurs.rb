class CreateCompetiteurs < ActiveRecord::Migration[5.0]
  def change
     create_table :competiteurs do |t|
        t.belongs_to :candidats, index: true
        t.belongs_to :bogestionelections, index: true
        t.timestamps
      end

  end
end
