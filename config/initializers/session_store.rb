# Be sure to restart your server when you modify this file.

<<<<<<< HEAD
WebShare::Application.config.session_store :cookie_store, key: '_WebShare_session'
=======
WebShare::Application.config.session_store :cookie_store, :key => '_WebShare_session'
>>>>>>> ad26b0fa014918a626bd47ec18ddd1d1945cc3a5

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# WebShare::Application.config.session_store :active_record_store
