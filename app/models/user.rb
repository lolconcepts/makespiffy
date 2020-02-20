class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   mount_uploader :avatar, AvatarUploader

   def fullname
   	if self.fname && self.lname
   		return self.fname + " " + self.lname
   	else
   		return ""
   	end
   end

   def addValue(amount)
   	self.bank += amount
   	self.save
   	return true
   end

   def makeAdmin
    self.admin = true
    self.save
   end

   def cashOut(user, amount)
   	user = User.find(user)
   	if amount <= user.bank
   		user.bank = user.bank - amount
   		user.save
   		return true
   	else
   		return false
   	end
   end

end
