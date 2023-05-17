# frozen_string_literal: true

describe Friend, type: :model do
  describe 'column' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:surname).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:phone_number).of_type(:string) }
    it { is_expected.to have_db_column(:place_of_knowing).of_type(:integer) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:surname) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(15) }
    it { is_expected.to validate_length_of(:surname).is_at_least(3).is_at_most(15) }
    it { is_expected.to validate_length_of(:phone_number).is_equal_to(9) }
  end
end
