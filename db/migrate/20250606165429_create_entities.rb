class CreateEntities < ActiveRecord::Migration[7.1]
  def change
    create_table :entities do |t|
      t.string :name
      t.text :description
      t.string :logo_url
      t.string :website
      t.string :address
      t.string :phone
      t.string :email
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
