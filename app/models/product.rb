class Product < ActiveRecord::Base
	belongs_to :user

#Get products by name
  def self.search(name)
    return Product.where("product_name like ?", "#{name}%");
  end
end
