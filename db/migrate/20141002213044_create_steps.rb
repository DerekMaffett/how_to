class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.text :name
      t.integer :list_id

      t.timestamps
    end

    add_index :steps, :list_id
  end
end
