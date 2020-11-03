class AddColorToScopes < ActiveRecord::Migration[6.0]
  def change
    add_column :scopes, :color, :string, null: false
  end
end
