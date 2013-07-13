class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :password_digest
      t.string :phone

      t.timestamps
    end
  end
end
