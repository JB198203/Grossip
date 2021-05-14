class User < ApplicationRecord
  has_many :gossips
  has_many :likes, dependent: :destroy
  has_many :comments
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
  belongs_to :city, optional: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true, presence: true
  validates :age, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0 }, presence: true
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }


end
