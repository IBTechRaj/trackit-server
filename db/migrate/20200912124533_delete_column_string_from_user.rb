class DeleteColumnStringFromUser < ActiveRecord::Migration[6.0]
  def change
  remove_column :users, :string
  end
end
