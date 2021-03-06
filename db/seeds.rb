# User GENERATION -----------------------------------------------------------------

User.delete_all

# Generate ADMIN user

User.create(
  name: "admin",
  email: "admin@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  admin: "true"
)

puts "ADMIN created, #{User.last.name}, #{User.last.email}, password: 123456"

# Generate normal users

n1 = 10**77
n2 = 2*n1
arr = [0,0,0]

20.times do 
  seller_chance = rand(1..4)
  #50% chance generate normal user
  if seller_chance == 1 or seller_chance == 4
    password = "123456"
    User.create(
      name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
      email: Faker::Internet.email,
      password: password,
      password_confirmation: password,
      admin: "false",
      seller: 0
    )
    puts "Normal user created"
    arr[0] += 1
  #25% chance generate seller user
  elsif seller_chance == 2
    password = "123456"
    User.create(
      name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
      email: Faker::Internet.email,
      password: password,
      password_confirmation: password,
      admin: "false",
      seller: 1
    )
    puts "Seller user created"
    arr[1] += 1
  #25% chance generate seller requested user
  elsif seller_chance == 3
    password = "123456"
    User.create(
      name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
      email: Faker::Internet.email,
      password: password,
      password_confirmation: password,
      admin: "false",
      seller: 2
    )
    puts "Seller requested user created"
    arr[2] += 1
  end
end

puts "NORMAL USERS CREATED: #{arr[0]}"
puts "SELLER USERS CREATED: #{arr[1]}"
puts "SELLER REQUESTED USERS CREATED: #{arr[2]}"
puts "-------------------------------------------------------"
puts "ALL PASSWORDS ARE: 123456"
puts "-------------------------------------------------------"

# LaptopBrand GENERATION -----------------------------------------------------------------

LaptopBrand.delete_all

arr = ['Apple','Dell','Lenovo', 'HP', 'Asus', 'Microsoft', 'MSI', 'Razer', 'Alienware']
arr.each_with_index {|v, i|
    a = LaptopBrand.new(
      name: arr[i],
    )
    a.picture.attach(io: File.open('./app/assets/images/logo.png'), filename: 'logo.png')
    a.save
    puts "LaptopBrand #{LaptopBrand.last.name} created"
  }

# Grade GENERATION -----------------------------------------------------------------

Grade.delete_all

arr = ['A GRADE', 'B GRADE', 'C GRADE']
arr_description = [
  'A GRADE: Near mint condition, faint scratches may be present',
  'B GRADE: visible scratches, worn look',
  'C GRADE: large scratches, dents, damage to exterior'
]
arr.each_with_index {|v, i|
    Grade.create(
      name: arr[i],
    )
    puts "Grade #{Grade.last.name} created"
  }

# Cpu GENERATION -----------------------------------------------------------------

Cpu.delete_all

arr = ['i3', 'i5', 'i7', 'i9', 'amd ryzen 3', 'amd ryzen 5', 'amd ryzen 9']
arr.each_with_index {|v, i|
    Cpu.create(
      name: arr[i],
    )
    puts "Cpu #{Cpu.last.name} created"
  }

# Ram GENERATION -----------------------------------------------------------------

Ram.delete_all

arr = ['4gb','8gb','16gb','32gb','64gb']
arr.each_with_index {|v, i|
    Ram.create(
      name: arr[i],
    )
    puts "Ram #{Ram.last.name} created"
  }

# HardDrive GENERATION -----------------------------------------------------------------

HardDrive.delete_all

arr = ['256gb','512gb','1tb','2tb']
arr.each_with_index {|v, i|
    HardDrive.create(
      name: arr[i],
    )
    puts "HardDrive #{HardDrive.last.name} created"
  }

# Laptop GENERATION -----------------------------------------------------------------

Laptop.delete_all
arr = ('a'..'z').to_a

40.times do
  price = rand(300..1000)
  brand = LaptopBrand.pluck(:id).sample
  a = Laptop.new(
    user_id: User.where(seller: "true").pluck(:id).sample,
    laptop_brand_id: brand,
    grade_id: Grade.pluck(:id).sample,
    cpu_id: Cpu.pluck(:id).sample,
    ram_id: Ram.pluck(:id).sample,
    hard_drive_id: HardDrive.pluck(:id).sample,
    model: "#{LaptopBrand.find(brand).name} #{Faker::Space.nasa_space_craft} #{arr.sample.capitalize()}#{Faker::Number.number(digits: 4)}",
    price: price,
    sold_status: "false"
  )
  # a.picture.attach(io: File.open('./app/assets/images/laptop.png'), filename: 'laptop.png')
  a.save
  puts "Laptop #{Laptop.last.model} created"
end

# LaptopOrder GENERATION -----------------------------------------------------------------

LaptopOrder.delete_all

arr = Laptop.pluck(:id)
20.times do
  sold_laptop = arr.sample
  LaptopOrder.create(
    user_id: User.where(seller: "false").pluck(:id).sample,
    laptop_id: sold_laptop
  )
  Laptop.find(sold_laptop).update(sold_status: "true")
  arr -= [sold_laptop]
  puts "LaptopOrder created"
end


