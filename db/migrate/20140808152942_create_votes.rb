class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :up?, default: true
      t.references :votable, polymorphic: true

      t.timestamps
    end
  end
end
