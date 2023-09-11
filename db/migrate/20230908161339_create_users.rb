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

    create_dummy_user
  end

  def create_dummy_user
    User.create(email: 'amshefer@gmail.com', password: '123456', first_name: 'Stefan', last_name: 'Stefanos', profile_image_url: 'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2')
  end
end
