# frozen_string_literal: true

class AddPhoneNumberToFriend < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :phone_number, :string
  end
end
