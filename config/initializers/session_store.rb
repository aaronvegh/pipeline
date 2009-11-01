# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pipeline_session',
  :secret      => '4d993ac527143fba7d7905a16e05ec6cad3b1269016361ba86c989bd7f8101a4dc694c8f134e9f861ca475ad6177ce74839ceb941a322992cecb6710e09767cf'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
