class AddFirstNameAndLastNameAndAddressAndHomePhoneAndCelPhoneAndRoleToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :FirstName, :string
    add_column :members, :LastName, :string
    add_column :members, :address, :string
    add_column :members, :HomePhone, :string
    add_column :members, :CelPhone, :string
    add_column :members, :role, :string
  end
end
