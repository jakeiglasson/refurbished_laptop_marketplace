# User GENERATION -----------------------------------------------------------------

User.delete_all

n1 = 10**77
n2 = 2*n1
arr = [0,0,0]

#generate users
20.times do 
  seller_chance = rand(1..4)
  #50% chance generate normal user
  if seller_chance == 1 or seller_chance == 4
    User.create(
      name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
      email: Faker::Internet.email,
      password: rand(n1..n2).to_s(36),
      admin: "false",
      seller: 0
    )
    puts "Normal user created"
    arr[0] += 1
  #25% chance generate seller user
  elsif seller_chance == 2
    User.create(
      name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
      email: Faker::Internet.email,
      password: rand(n1..n2).to_s(36),
      admin: "false",
      seller: 1
    )
    puts "Seller user created"
    arr[1] += 1
  #25% chance generate seller requested user
  elsif seller_chance == 3
    User.create(
      name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
      email: Faker::Internet.email,
      password: rand(n1..n2).to_s(36),
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

# LaptopBrand GENERATION -----------------------------------------------------------------

LaptopBrand.delete_all

arr = ['apple','dell','lenovo', 'hp', 'asus', 'microsoft', 'msi', 'razer', 'alienware']
arr.each_with_index {|v, i|
    LaptopBrand.create(
      name: arr[i]
    )
    puts "LaptopBrand #{LaptopBrand.last.name} created"
  }


# 5.times do
#   LaptopBrand.create(
#     name: Faker::Company.name
#   )
#   puts "LaptopBrand #{LaptopBrand.last.name} created"
# end

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
      description: arr_description[i]
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
