class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.belongs_to :user, null: true
      t.string :name
      t.string :slug
      t.string :race
      t.string :player_type
      t.text :story
      t.string :access_code
      t.integer :power, default: 100
      t.integer :attack, default: 100
      t.integer :defense, default: 100
      t.integer :charisma, default: 100
      t.integer :spirit, default: 100
      t.integer :special_ability, default: 0

      t.timestamps
    end
  end
end
