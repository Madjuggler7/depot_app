require 'test_helper'
class ProductTest < ActiveSupport::TestCase
test "product attributes must not be empty" do
  product = Product.new
  assert product.invalid?
  assert product.errors[:title].any?
  assert product.errors[:description].any?
  assert product.errors[:price].any?
  assert product.errors[:image_url].any?
  end


  test 'title must be present' do
    product = Product.new(title: '')
    product.valid?
    assert_includes product.errors.messages[:title], "can't be blank"
  end
  test 'image_url must be present' do
   product = Product.new(image_url: '')
    product.valid?
    assert_includes product.errors.messages[:image_url], "can't be blank"
  end
end