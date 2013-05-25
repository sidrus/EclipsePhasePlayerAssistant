# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ItemCategory.create(name: 'Firearms')
ItemCategory.create(name: 'Railguns')
ItemCategory.create(name: 'Beam Weapons')
ItemCategory.create(name: 'Seekers')
ItemCategory.create(name: 'Spray Weapons')
ItemCategory.create(name: 'Thrown Weapons')

ItemType.create(name: 'Light Pistol', item_category: ItemCategory.find_by_name('Firearms'))
ItemType.create(name: 'Medium Pistol', item_category: ItemCategory.find_by_name('Firearms'))
ItemType.create(name: 'Heavy Pistol', item_category: ItemCategory.find_by_name('Firearms'))
ItemType.create(name: 'SMG', item_category: ItemCategory.find_by_name('Firearms'))
ItemType.create(name: 'Assault Rifle', item_category: ItemCategory.find_by_name('Firearms'))
ItemType.create(name: 'Sniper Rifle', item_category: ItemCategory.find_by_name('Firearms'))
ItemType.create(name: 'Machine Gun', item_category: ItemCategory.find_by_name('Firearms'))

ItemType.create(name: 'Cybernetic Hand Laser', item_category: ItemCategory.find_by_name('Beam Weapons'))
ItemType.create(name: 'Laser Pulser', item_category: ItemCategory.find_by_name('Beam Weapons'))
ItemType.create(name: 'Microwave Agonizer', item_category: ItemCategory.find_by_name('Beam Weapons'))
ItemType.create(name: 'Particle Beam Bolter', item_category: ItemCategory.find_by_name('Beam Weapons'))
ItemType.create(name: 'Plasma Rifle', item_category: ItemCategory.find_by_name('Beam Weapons'))
ItemType.create(name: 'Stunner', item_category: ItemCategory.find_by_name('Beam Weapons'))

ItemType.create(name: 'Blades', item_category: ItemCategory.find_by_name('Thrown Weapons'))
ItemType.create(name: 'Mini-grenades', item_category: ItemCategory.find_by_name('Thrown Weapons'))
ItemType.create(name: 'Standard Grenades', item_category: ItemCategory.find_by_name('Thrown Weapons'))

Item.create(name: 'Sidrus\'s Effective Pulser', item_type: ItemType.find_by_name('Laser Pulser'))
Item.create(name: 'Dragkhar\'s Demise', item_type: ItemType.find_by_name('Laser Pulser'))
Item.create(name: 'Pulserizor', item_type: ItemType.find_by_name('Laser Pulser'))
Item.create(name: 'Knife', item_type: ItemType.find_by_name('Blades'))
Item.create(name: 'Frag Grenade', item_type: ItemType.find_by_name('Standard Grenades'))

