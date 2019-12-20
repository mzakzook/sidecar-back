class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :cell_number
      t.string :avatar
      t.string :password

      t.timestamps
    end
  end
end