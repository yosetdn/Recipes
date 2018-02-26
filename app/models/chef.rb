class Chef < ApplicationRecord
  has_many:recipes
  before_save{self.email=email.downcase}
  validates :chefname,presence: true,length:{maximum:40}
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,presence:true, uniqueness:{case_sensitive:false},format: {with: VALID_EMAIL_REGEX },length:{maximum:255}
end
