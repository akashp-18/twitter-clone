class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  enum role: [:default, :author, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :tweets

  def set_default_role
    self.role ||= :default
  end
end