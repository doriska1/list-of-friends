class AddPlaceOfKnowingToFriend < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :place_of_knowing, :integer, default: Friend.place_of_knowings[:other]
  end
end
