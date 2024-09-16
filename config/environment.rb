# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

cipher = OpenSSL::Cipher::AES.new(128, :CBC)
cipher.encrypt
cipher.key = @secret # Asegúrate de que @secret sea de 16 bytes