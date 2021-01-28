require 'test_helper'
class Product < ApplicationRecord
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i, # <<<<<----
    message: 'must be a URL for GIF, JPG, or PNG image.'
  }
end

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  # assert true
  # end

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
    end
  

test "product price must be positive" do
  product = Product.new(title: "My Book Title",
  description: "yyy",
  image_url: "zzz.jpg")
  product.price = -1
  assert product.invalid?
  assert_equal ["must be greater than or equal to 0.01"],
  product.errors[:price]
  product.price = 0
  assert product.invalid?
  assert_equal ["must be greater than or equal to 0.01"],
  product.errors[:price]
  product.price = 1
  assert product.valid?
  end

end