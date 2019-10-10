class AddExperienceLevelToPilots < ActiveRecord::Migration[6.0]
  def change
    add_column :pilots, :experience, :string
  end
end
