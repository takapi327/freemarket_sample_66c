require 'rails_helper'

RSpec.describe Category, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with category' do
        expect(build(:category, ancestry:nil)).to be_valid
      end

      it 'is valid with category' do
        expect(build(:category)).to be_valid
      end
    end
  end
end
