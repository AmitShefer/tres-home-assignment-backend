class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, :presence => true
      t.string :password_digest, :presence => true
      t.string :first_name, :presence => true
      t.string :last_name, :presence => true
      t.string :profile_image_url

      t.timestamps
    end
  end
end
