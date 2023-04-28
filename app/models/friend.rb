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
end
