class CreateScopeStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :scope_statuses do |t|
      t.references :scope, foreign_key: true
      t.integer :progress, null: false, default: 0
      t.timestamps null: false
    end
  end
end
