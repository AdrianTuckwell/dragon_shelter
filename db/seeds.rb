require('pry-byebug')
require_relative('../models/dragon.rb')
require_relative('../models/owner.rb')
require_relative('../models/adoption.rb')

Adoption.delete_all()
Dragon.delete_all()
Owner.delete_all()

# --- Create dragons -------------------------------------
dragon1 = Dragon.new({ 'name' => 'Toothless', 
                       'type' => 'Night Fury', 
                       'trained' => 'TRUE', 
                       'adopted' => 'TRUE', 
                       'admission_date' => '25-oct-2016',                       
                       'trained_date' => '25-oct-2016',
                       'adoption_date' => '25-oct-2016'})

dragon2 = Dragon.new({ 'name' => 'Big Red', 
                       'type' => 'Changewing', 
                       'trained' => 'TRUE', 
                       'adopted' => 'TRUE', 
                       'admission_date' => '25-oct-2016',                       
                       'trained_date' => '25-oct-2016',
                       'adoption_date' => '25-oct-2016'})

dragon3 = Dragon.new({ 'name' => 'Paradice', 
                       'type' => 'Deadly Nadder', 
                       'trained' => 'TRUE', 
                       'adopted' => 'TRUE', 
                       'admission_date' => '25-oct-2016',                       
                       'trained_date' => '25-oct-2016',
                       'adoption_date' => '25-oct-2016'})

dragon4 = Dragon.new({ 'name' => 'Sunshine', 
                       'type' => 'Giant Bee-Eater', 
                       'trained' => 'FALSE', 
                       'adopted' => 'FALSE', 
                       'admission_date' => '25-oct-2016',                       
                       'trained_date' => '25-oct-2016',
                       'adoption_date' => '25-oct-2016'})

dragon5 = Dragon.new({ 'name' => 'Rainbow', 
                       'type' => 'Gronckle', 
                       'trained' => 'FALSE', 
                       'adopted' => 'FALSE', 
                       'admission_date' => '25-oct-2016',                       
                       'trained_date' => '25-oct-2016',
                       'adoption_date' => '25-oct-2016'})

dragon6 = Dragon.new({ 'name' => 'Pheonix', 
                       'type' => 'Hideous Zippleback', 
                       'trained' => 'FALSE', 
                       'adopted' => 'FALSE', 
                       'admission_date' => '25-oct-2016',                       
                       'trained_date' => '25-oct-2016',
                       'adoption_date' => '25-oct-2016'})

dragon7 = Dragon.new({ 'name' => 'Dark Dave', 
                       'type' => 'Monstrous Nightmare', 
                       'trained' => 'FALSE', 
                       'adopted' => 'FALSE', 
                       'admission_date' => '25-oct-2016',                       
                       'trained_date' => '25-oct-2016',
                       'adoption_date' => '25-oct-2016'})

dragon8 = Dragon.new({ 'name' => 'Night Fury', 
                       'type' => 'Seadragonus Giganticus Maximus (Red Death)', 
                       'trained' => 'FALSE', 
                       'adopted' => 'FALSE', 
                       'admission_date' => '25-oct-2016',                       
                       'trained_date' => '25-oct-2016',
                       'adoption_date' => '25-oct-2016'})


dragon9 = Dragon.new({ 'name' => 'Carsten', 
                       'type' => 'Terrible Terror', 
                       'trained' => 'FALSE', 
                       'adopted' => 'FALSE', 
                       'admission_date' => '25-oct-2016',                       
                       'trained_date' => '25-oct-2016',
                       'adoption_date' => '25-oct-2016'})

dragon10 = Dragon.new({ 'name' => 'Slurge', 
                        'type' => 'Thunder Drum', 
                        'trained' => 'FALSE', 
                        'adopted' => 'FALSE', 
                        'admission_date' => '25-oct-2016',                       
                        'trained_date' => '25-oct-2016',
                        'adoption_date' => '25-oct-2016'})


dragon1.save
dragon2.save
dragon3.save
dragon4.save
dragon5.save
dragon6.save
dragon7.save
dragon8.save
dragon9.save
dragon10.save

# --- Create owners -------------------------------------
owner1 = Owner.new({ 'name' => 'Hiccup', 
                     'address' => 'Isle of Berk'})

owner2 = Owner.new({ 'name' => 'Astrid Hofferson', 
                     'address' => 'Dragon Island'})

owner3 = Owner.new({ 'name' => 'Snotlout Jorgenson', 
                     'address' => 'Dragon Island'})

owner4 = Owner.new({ 'name' => 'Stoick the Vast', 
                     'address' => 'Botany Blight'})

owner5 = Owner.new({ 'name' => 'Ruffnut Thorston', 
                     'address' => 'Screaming Death Island'})

owner6 = Owner.new({ 'name' => 'Tuffnut Thorston', 
                     'address' => 'Sea Stacks'})

owner7 = Owner.new({ 'name' => 'Fishlegs Ingerman', 
                     'address' => 'Dragon Island'})

owner8 = Owner.new({ 'name' => 'Gobber', 
                     'address' => 'Fireworm Island'})

owner9 = Owner.new({ 'name' => 'Spitelout Jorgenson',
                     'address' => 'Fireworm Island'})

owner10 = Owner.new({ 'name' => 'Phlegma the Fierce', 
                      'address' => 'Dragon Island'})

owner1.save
owner2.save
owner3.save
owner4.save
owner5.save
owner6.save
owner7.save
owner8.save
owner9.save
owner10.save

# --- Create adoptions -------------------------------------
adoption1 = Adoption.new({'dragon_id' => dragon1.id, 'owner_id' => owner1.id})
adoption2 = Adoption.new({'dragon_id' => dragon2.id, 'owner_id' => owner2.id})
adoption3 = Adoption.new({'dragon_id' => dragon3.id, 'owner_id' => owner3.id})
adoption4 = Adoption.new({'dragon_id' => dragon4.id, 'owner_id' => owner4.id})
adoption5 = Adoption.new({'dragon_id' => dragon5.id, 'owner_id' => owner5.id})
adoption6 = Adoption.new({'dragon_id' => dragon6.id, 'owner_id' => owner6.id})
adoption7 = Adoption.new({'dragon_id' => dragon7.id, 'owner_id' => owner7.id})
adoption8 = Adoption.new({'dragon_id' => dragon8.id, 'owner_id' => owner8.id})
adoption9 = Adoption.new({'dragon_id' => dragon9.id, 'owner_id' => owner9.id})
adoption10 = Adoption.new({'dragon_id' => dragon10.id, 'owner_id' => owner10.id})

adoption1.save
adoption2.save
adoption3.save
adoption4.save
adoption5.save
adoption6.save
adoption7.save
adoption8.save
adoption9.save
adoption10.save

# --- jump into debug -------------------------------------
binding.pry
nil