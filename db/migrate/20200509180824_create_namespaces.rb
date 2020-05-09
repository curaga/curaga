class CreateNamespaces < ActiveRecord::Migration[6.0]
  def change
    create_table :namespaces do |t|
      t.string :slug, null: false

      t.timestamps
    end

    add_index :namespaces, :slug, unique: true
  end
end
