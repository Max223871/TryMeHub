# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create sample blogposts
10.times do
  Blogpost.create(
    name: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    price: Faker::Commerce.price(range: 0..100.0),
    image_url: Faker::LoremFlickr.image,
    created_at: Faker::Date.between(from: '2023-01-01', to: '2023-12-31'),
    updated_at: Faker::Date.between(from: '2023-01-01', to: '2023-12-31')
  )
end

# Create sample contacts
10.times do
  Contact.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    message: Faker::Lorem.paragraph(sentence_count: 2),
    contact_number: Faker::PhoneNumber.cell_phone,
    created_at: Faker::Date.between(from: '2023-01-01', to: '2023-12-31'),
    updated_at: Faker::Date.between(from: '2023-01-01', to: '2023-12-31')
  )
end

# Create sample faqs
10.times do
  Faq.create(
    question: Faker::Lorem.sentence(word_count: 6),
    answer: Faker::Lorem.paragraph(sentence_count: 2),
    created_at: Faker::Date.between(from: '2023-01-01', to: '2023-12-31'),
    updated_at: Faker::Date.between(from: '2023-01-01', to: '2023-12-31')
  )
end

# Create sample users
10.times do
  user = User.create!(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password_digest: BCrypt::Password.create('password'),
    gender: ['Male', 'Female'].sample,
    country: Faker::Address.country,
    terms_and_conditions: true,
    created_at: Faker::Date.between(from: '2023-01-01', to: '2023-12-31'),
    updated_at: Faker::Date.between(from: '2023-01-01', to: '2023-12-31')
  )


  # Attach a profile picture to the user
  if user.valid?
    user.profile_picture.attach(
      io: File.open(Rails.root.join('app', 'assets', 'images', 'profile_pic_woman.jpg')),
      filename: 'profile_pic_woman.jpg',
      content_type: 'image/jpg'
    )
  end
end
