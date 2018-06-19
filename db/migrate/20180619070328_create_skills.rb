class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.references :stack, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
