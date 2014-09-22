class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	OPERATIONS = '+\-*\/'
	def admin? 
		email == 'admin@u.u' 
	end
	def able_admin?(expression)
    expression =~ /^[0-9#{OPERATIONS}]+[0-9]$/
	end
  def able?(expression)
    expression =~ /^[0-9#{operations}]+[0-9]$/
  end

	def correct_value?(expression)
    numbers = expression.scan(/(\d+)/).flatten
    numbers.each { |s| return false if s.to_f > number.to_f}
	end

end