SPREE STORES EXTENSION
======================

This is a Spree Ecommerce Extension for adding information about brick and mortar stores to your online store.

FEATURES
========

* Admin pages to create stores. It will geocode stores using Google Maps if you enter a valid address.
* Admin pages to add people (staff) and events to the stores.
* A Store Locator (/stores)
* Store pages for each store
* Store people (staff) pages

see http://spreecommerce.com

see http://github.com/railsdog/spree

COMPATIBILITY
=============

Tested with MySql on Spree Edge as of 5/20/2010

Does not work with Sqlite

SETUP
=====

> rake db:migrate
> cp config/gmaps_api_key.yml.example config/gmaps_api_key.yml

> Edit your config/gmaps_api_key.yml file with your Google Maps API key. See below.

GOOGLE MAPS API
===============

You need a Google Maps API key. Sign up for one here:

http://code.google.com/apis/maps/signup.html

Then put it in your _config/gmaps_api_key.yml_ file


NOTES
=====

Thanks to Geokit Rails: http://geokit.rubyforge.org/

Thanks to th ym4r_gm: http://ym4r.rubyforge.org/

TODO
====

Internationalization is half-done.
