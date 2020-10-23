class CreateScopes < ActiveRecord::Migration[6.0]
  def change
    create_table :scopes do |t|
      t.string :trello_card_id, null: false
      t.timestamps null: false
    end

    add_index :scopes, :trello_card_id, unique: true
  end
end
