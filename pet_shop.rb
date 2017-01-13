def pet_shop_name(pet_shop_hash)
	return pet_shop_hash[:name]
end

def total_cash(pet_shop_hash)
	return pet_shop_hash[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop_hash, transaction_amount)
	return pet_shop_hash[:admin][:total_cash] += transaction_amount
end

def pets_sold(pet_shop_hash)
	return pet_shop_hash[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop_hash, number_of_pets)
	return pet_shop_hash[:admin][:pets_sold] += number_of_pets
end

def stock_count(pet_shop_hash)
	return pet_shop_hash[:pets].count()
end

def pets_by_breed(pet_shop_hash, pet_breed_string)
	pets_array = []
	for pet in pet_shop_hash[:pets]
		if(pet[:breed] == pet_breed_string)
			pets_array.push(pet)
		end
	end
	return pets_array
end

def find_pet_by_name(pet_shop_hash, pet_name_string)
	for pet in pet_shop_hash[:pets]
		if(pet[:name] == pet_name_string)
			return pet
		end
	end
	return nil
end

def remove_pet_by_name(pet_shop_hash, pet_name_string)
	for pet in pet_shop_hash[:pets]
		if(pet[:name] == pet_name_string)
			pet_shop_hash[:pets].delete(pet)
		end
	end
end

def add_pet_to_stock(pet_shop_hash, pet_to_add_hash)
	pet_shop_hash[:pets].push(pet_to_add_hash)
end

def customer_pet_count(customer_hash)
	return customer_hash[:pets].length()
end

def add_pet_to_customer(customer_hash, new_pet_hash)
	customer_hash[:pets].push(new_pet_hash)
end