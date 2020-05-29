class CreateNamespaceMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :namespace_memberships do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :namespace, null: false, foreign_key: true
      t.boolean :default, null: false, default: false

      t.timestamps
    end

    remove_column :namespaces, :user_id, :bigint
  end
end
