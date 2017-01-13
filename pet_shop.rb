def pet_shop_name pet_shop_hash
  pet_shop_hash[:name]
end

def total_cash pet_shop_hash
  pet_shop_hash[:admin][:total_cash]
end

def add_or_remove_cash pet_shop_hash, transaction_amount
  pet_shop_hash[:admin][:total_cash] += transaction_amount
end

def pets_sold pet_shop_hash
  pet_shop_hash[:admin][:pets_sold]
end

def increase_pets_sold pet_shop_hash, number_of_pets
  pet_shop_hash[:admin][:pets_sold] += number_of_pets
end

def stock_count pet_shop_hash
  pet_shop_hash[:pets].count
end

def pets_by_breed pet_shop_hash, pet_breed_string
  pet_shop_hash[:pets].select {|pet|pet.has_value? pet_breed_string}
end

def find_pet_by_name pet_shop_hash, pet_name_string
  pet_shop_hash[:pets].detect{|pet|pet.has_value? pet_name_string}
end

def remove_pet_by_name pet_shop_hash, pet_name_string
  pet_shop_hash[:pets].delete_if{|pet|pet.has_value? pet_name_string}
end

def add_pet_to_stock pet_shop_hash, pet_to_add_hash
  pet_shop_hash[:pets].push pet_to_add_hash
end

def customer_pet_count customer_hash
  customer_hash[:pets].length
end

def add_pet_to_customer customer_hash, new_pet_hash
  customer_hash[:pets].push new_pet_hash
end

def customer_can_afford_pet customer_hash, new_pet_hash
  customer_hash[:cash] - new_pet_hash[:price] >= 0
end

def sell_pet_to_customer pet_shop_hash, new_pet_hash, customer_hash
  single_purchase(pet_shop_hash, new_pet_hash, customer_hash) if new_pet_hash.is_a? Hash
  if new_pet_hash.is_a? Array
    for pet in new_pet_hash
      single_purchase(pet_shop_hash, pet, customer_hash)
    end
  end
end
  def single_purchase(pet_shop_hash, new_pet_hash, customer_hash)
      unless new_pet_hash == nil
    if(customer_can_afford_pet(customer_hash, new_pet_hash))
      add_pet_to_customer(customer_hash, new_pet_hash)
      increase_pets_sold(pet_shop_hash, 1)
      add_or_remove_cash(pet_shop_hash, new_pet_hash[:price])
    end
  end
end