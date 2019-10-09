class AddUserRefToPilots < ActiveRecord::Migration[6.0]
  def change
    add_reference :pilots, :user, foreign_key: true
  end
end
