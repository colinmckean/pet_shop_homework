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
	return pet_shop_hash[:pets].count
end

def pets_by_breed(pet_shop_hash, pet_breed_string)
	pets_array = []
	for pet in pet_shop_hash[:pets]
		if pet[:breed] == pet_breed_string
			pets_array.push(pet)
		end
	end
	return pets_array
end

def find_pet_by_name(pet_shop_hash, pet_name_string)
	for pet in pet_shop_hash[:pets]
		if pet[:name] == pet_name_string
			return pet
		end
	end
	return nil
end
