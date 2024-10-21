class CreateColaborators < ActiveRecord::Migration[7.2]
  def change
    create_table :colaborators do |t|
      t.string :name, limit: 50, null: false
      t.string :email, limit: 50, null: false
      t.string :address, limit: 100

      t.timestamps
    end
  end
end
