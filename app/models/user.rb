class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :age
  validate :is_email
  def full_name
    "#{last_name}, #{first_name}"
  end

  def is_email
    errors.add(:email, "Invalid email format") unless email.include?("@")
  end
end
