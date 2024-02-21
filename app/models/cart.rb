class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product) 
    current_item = line_items.find_by(product_id: product.id)

    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id)
    end
    current_item
  end

  def total_price 
    line_items.sum { |item| item.total_price }
  end
end

# A cart has many associated line items. These are linked to the cart because each line item contains a reference to its cart's ID. The dependent:destroy part indicates that the existence of line items is dependent on the existence of the cart. If we destroy the cart, deleting it from the database, we want Rails to also destroy any line items that are associated with the cart.

# Now that the Cart is declared to have many line items, we can reference them (as a collection) from a cart object. 

# cart = Cart.find(id) 
# puts "This cart has #{cart.line_items.count} line items"