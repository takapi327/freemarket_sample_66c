require 'rails_helper'

RSpec.describe Image, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with image' do
        expect(build(:image)).to be_valid
      end
    end

    context 'can not save' do
      it 'is valid with image' do
        image = build(:image, image: nil)
        image.valid?
        expect(image.errors[:image])
      end
    end
  end
end
