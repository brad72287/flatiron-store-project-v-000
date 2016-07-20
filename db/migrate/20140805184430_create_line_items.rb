class CreateLineItems < ActiveRecord::Migration
  def change
    create_table(:line_items) do |t|
      t.references :item
      t.references :cart
      t.integer :quantity, :default => 1
    end
  end
end
