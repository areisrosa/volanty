class CreateCavs < ActiveRecord::Migration[6.1]
  def change
    create_table :cavs do |t|
      t.string :name

      t.timestamps
    end
  end
end
