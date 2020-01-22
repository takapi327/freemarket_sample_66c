require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with allproduct' do
        expect(build(:product, buyer_id: nil)).to be_valid
      end

      it 'is valid with allproduct' do
        expect(build(:product)).to be_valid
      end
    end
    
    context 'can not save' do
      it 'is valid with allproduct' do
        product = build(:product, name: nil,)
        product.valid?
        expect(product.errors[:name])
      end

      it 'is valid with allproduct' do
        product = build(:product, price: nil)
        product.valid?
        expect(product.errors[:price])
      end

      it 'is valid with allproduct' do
        product = build(:product, content: nil)
        product.valid?
        expect(product.errors[:content])
      end

      it 'is valid with allproduct' do
        product = build(:product, status: nil)
        product.valid?
        expect(product.errors[:status])
      end

      it 'is valid with allproduct' do
        product = build(:product, derivery: nil)
        product.valid?
        expect(product.errors[:derivery])
      end

      it 'is valid with allproduct' do
        product = build(:product, burden: nil)
        product.valid?
        expect(product.errors[:burden])
      end

      it 'is valid with allproduct' do
        product = build(:product, day: nil)
        product.valid?
        expect(product.errors[:day])
      end
    end
  end
end