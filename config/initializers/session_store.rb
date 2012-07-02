# Be sure to restart your server when you modify this file.

DictApp::Application.config.session_store :cookie_store, key: '_dict-app_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# DictApp::Application.config.session_store :active_record_store
