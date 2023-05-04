# == Schema Information
#
# Table name: friends
#
#  id           :bigint           not null, primary key
#  email        :string
#  name         :string
#  phone_number :string
#  surname      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Friend < ApplicationRecord
    validates :name, presence: true, length: { minimum:3, maximum:15}
    validates :surname, presence: true, length: { minimum: 3, maximum: 15}
    validates :email, presence: true
    validates :phone_number, presence: true, length: { is: 9 }
end
