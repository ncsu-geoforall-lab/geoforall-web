#!/bin/sh

# gets the latest OSGeoRELs points and info from geoforall.

wget http://www.geoforall.org/locations/OSGEoLabs.json
mv OSGEoLabs.json labs_points.json
