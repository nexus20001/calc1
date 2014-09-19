class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	OPERATIONS = '+-*/'
	def admin? 
		email == 'admin@u.u' 
	end
	def vuln?(operation)
		operations.include? OPERATIONS
	end
	def able?(val1, val2, operation)
		correct_value?(val1, val2) && correct_opperation?(operation)
	end

	def correct_value?(val1, val2)
		val1.to_f <  number.to_f && val2.to_f < number.to_f
	end

	def correct_opperation?(operation)
		operations.include? operation
	end
end