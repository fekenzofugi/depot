require "test_helper"

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  test "product attributes must not be empty" do 
    product = Product.new
    
    # assert -> if the field is true nothing happens if the field is false the assertion fails. The framework will output a message and will stop executing the test method.
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?
  end
end