# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fhc_committee_session',
  :secret      => '30d1262f52249c528be21fedcbd3347297c354dffce27a25391fd7e8b52ea01494e33a5c6887e0d686e325dc5ca4ac330c0be3dc2a1d38ae03833d99c6515818'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
