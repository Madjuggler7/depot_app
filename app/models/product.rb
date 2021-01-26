class Product < ApplicationRecord
    validates :title, :description, :image_url, presence:true
    validates :price, numericality: { greater_than_or_equeal_to:0.01 }
    
end
