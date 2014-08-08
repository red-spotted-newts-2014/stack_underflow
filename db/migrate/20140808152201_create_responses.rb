class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :responsable, index: true
      t.string :responsable_type
      t.text :body

      t.timestamps
    end
  end
end
