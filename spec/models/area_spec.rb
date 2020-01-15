require 'rails_helper'

RSpec.describe Area, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with name' do
        expect(build(:area)).to be_valid
      end
    end
    context 'can not save' do
      it 'is valid with name' do
        area = build(:area, name: nil)
        area.valid?
        expect(area.errors[:name])
      end
    end
  end
end
