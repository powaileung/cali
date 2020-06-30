class AddConfirmableToMembers < ActiveRecord::Migration[5.2]
  def up
    add_column :members, :unconfirmed_email, :string
    add_column :members, :confirmation_token, :string
    add_column :members, :confirmed_at, :string
    add_column :members, :confirmation_sent_at, :datetime
    add_index :members, :confirmation_token, :unique => true

    Member.update_all(:confirmed_at => Time.now)
    #your current data will be treated as if they have confirmed their account
  end

  def down
    remove_column :members, :unconfirmed_email, :confirmation_token, :confirmed_at, :confirmation_sent_at
  end
end
