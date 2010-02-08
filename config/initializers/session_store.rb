# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_itunesmovieserver_session',
  :secret      => 'b00f717fc630e1fc95fc1c23320650c943c58d705f0bb8e9d6a6c36c7b2b4722da59311dd0c62fc41a9ccfef9ae67ebe50d4988c3c741907d2a3b1ec842ebca0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
