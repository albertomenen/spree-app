# config/environment.rb

# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Configuración de la clave para el cifrado
@secret = if ENV['CIPHER_KEY_DUMMY']
             ENV['CIPHER_KEY_DUMMY'] # Clave dummy de 16 bytes para la precompilación de activos
           elsif ENV['CIPHER_KEY']
             ENV['CIPHER_KEY'] # Clave real de 16 bytes
           else
             raise "No se encontró una clave de cifrado válida"
           end

# Asegúrate de que la clave es de 16 bytes
if @secret.length != 16
  raise "La clave de cifrado debe tener exactamente 16 bytes"
end

puts "Longitud de la clave de cifrado: #{@secret.length}" # Agrega esta línea para verificar la longitud

cipher = OpenSSL::Cipher::AES.new(128, :CBC)
cipher.encrypt
cipher.key = @secret
