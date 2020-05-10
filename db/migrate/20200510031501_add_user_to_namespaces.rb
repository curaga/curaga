class AddUserToNamespaces < ActiveRecord::Migration[6.0]
  def change
    add_reference :namespaces, :user, null: false, foreign_key: true
  end
end
