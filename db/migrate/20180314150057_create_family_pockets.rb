class CreateFamilyPockets < ActiveRecord::Migration[5.1]
  def change
    create_table :family_pockets do |t|
      t.references :family, foreign_key: true
      t.references :pocket, foreign_key: true

      t.timestamps
    end
  end
end
