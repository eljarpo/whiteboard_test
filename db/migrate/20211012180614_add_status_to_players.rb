class AddStatusToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :is_visible, :boolean, default: true
  end
end
