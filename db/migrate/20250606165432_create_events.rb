class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.string :location
      t.references :entity, null: false, foreign_key: true
      t.datetime :deleted_at
      t.datetime :time

      t.timestamps
    end
  end
end
