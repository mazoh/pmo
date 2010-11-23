# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pmo_session',
  :secret      => 'b2f58b2fad5841f5d37eb95711d8e9ff990146f544635c59f5e1fb1ed496ca387a70573503380763276d03a8afe45ff3fe5fafdfa89b1a61e34f18cf0caac4cd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
