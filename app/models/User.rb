class User < ApplicationRecord
  has_secure_password
  has_one_attached :profile_picture

  # Add this line if a user can have many posts
  has_many :posts

  validates :username, :email, :password_digest, :gender, :country, presence: true
  validates :terms_and_conditions, acceptance: true

  validate :acceptable_image

  def profile_picture_url
    if profile_picture.attached?
      Rails.application.routes.url_helpers.rails_blob_url(profile_picture)
    else
      '/images/default-profile-picture.png'
    end
  end

  private

  def acceptable_image
    return unless profile_picture.attached?

    unless profile_picture.blob.content_type.start_with?('image/')
      profile_picture.purge
      errors.add(:profile_picture, 'must be an image')
    end

    if profile_picture.blob.byte_size > 1.megabyte
      profile_picture.purge
      errors.add(:profile_picture, 'size must be less than 1MB')
    end
  end
end
