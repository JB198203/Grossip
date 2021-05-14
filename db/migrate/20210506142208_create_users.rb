class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.belongs_to :city
      t.integer :age
      t.text :description

      t.timestamps
    end
  end
end
