# config/initializers/cipher_key.rb
@secret = ENV['CIPHER_KEY'] || 'defaultfallbackkey123' # Fallback en caso de que la variable no esté configurada
