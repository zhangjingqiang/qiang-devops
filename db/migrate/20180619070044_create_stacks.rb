class CreateStacks < ActiveRecord::Migration[5.2]
  def change
    create_table :stacks do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
