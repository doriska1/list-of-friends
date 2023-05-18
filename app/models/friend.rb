# frozen_string_literal: true

# == Schema Information
#
# Table name: friends
#
#  id               :bigint           not null, primary key
#  email            :string
#  name             :string
#  phone_number     :string
#  place_of_knowing :integer          default("other")
#  surname          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Friend < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 15 }
  validates :surname, presence: true, length: { minimum: 3, maximum: 15 }
  validates :email, presence: true
  validates :phone_number, presence: true, length: { is: 9 }

  enum place_of_knowing: { school: 0, work: 1, childhood: 2, college: 3, other: 4 }

  scope :childhood, -> { where(place_of_knowing: :childhood) }
  scope :work, -> { where(place_of_knowing: :work) }
  scope :school, -> { where(place_of_knowing: :school) }
  scope :college, -> { where(place_of_knowing: :college) }
end
