class DeleteNullTrue < ActiveRecord::Migration[6.0]
  def change
    change_column :companies, :user_id, :integer, :null => true
  end
end
