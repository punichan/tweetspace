class RenameImageColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :image, :avater
  end
end
