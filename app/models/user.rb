class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :chores, :dependent => :destroy end

   mount_uploader :avatar, AvatarUploader

   def fullname
   	if self.fname && self.lname
   		return self.fname + " " + self.lname
   	else
   		return ""
   	end
   end

   def addValue(amount)
   	self.bank += amount.to_i
   	self.save
   	return true
   end

   def makeAdmin
    self.admin = true
    self.save
   end

   def cashOut(amount)
   	user = self
   	if amount <= user.bank
   		user.bank = user.bank - amount
   		user.save
   		return true
   	else
   		return false
   	end
   end

end
