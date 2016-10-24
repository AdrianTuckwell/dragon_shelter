require('pry-byebug')
require_relative('../models/dragon.rb')
require_relative('../models/owner.rb')
require_relative('../models/adoption.rb')

Adoption.delete_all()
Dragon.delete_all()
Owner.delete_all()

# --- Create dragons -------------------------------------
dragon1 = Dragon.new({ 'name' => 'Toothless', 'type' => 'Night Fury'})

dragon1.save

# --- Create owners -------------------------------------
owner1 = Owner.new({ 'name' => 'Hiccup', 'address' => 'Dragon Island'})

owner1.save

# --- Create adoptions -------------------------------------
adoption1 = Adoption.new({'dragon_id' => dragon1.id, 'owner_id' => owner1.id})

adoption1.save

# --- jump into debug -------------------------------------
binding.pry
nil