class Electeur < ApplicationRecord
	has_secure_password
	#before_save :encrypt_password
	#before_create :encrypt_password

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :ut_email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }

	# def encrypt_password
	# 	if password_digest.present?
	# 		self.password_digest = Digest::SHA1.hexdigest(password_digest)
	# 	end
	# end
# def self.authenticate(email, password)
# 		electeur = Electeur.find_by(ut_email: email)
# 		abort params[:session][:password_digest]
# 		aaa = Digest::SHA1.hexdigest(password)
# 		if electeur && electeur.password_digest == password
# 			return electeur
# 		else
# 			return nil
# 		end
# 	end
	
end

