class DeleteReferencesCompanyUser < ActiveRecord::Migration[6.0]
  def change
    if foreign_key_exists?(:companies, :users)
      remove_foreign_key :companies, :users
    end
  end
end
