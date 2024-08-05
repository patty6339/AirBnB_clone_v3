#!/usr/bin/python3
"""This module creates a Flask app"""

from api.v1.views import app_views
from flask import jsonify, abort, make_response, request
from models.city import City
from models import storage
from models.place import Place
from models.user import User
import requests
import json
from os import getenv


@app_views.route(
    '/cities/<city_id>/places', methods=['GET'], strict_slashes=False
    )
def get_places(city_id):
    """Retrieve the list of all Place objects of a City"""
    city = storage.get(City, city_id)
    if not city:
        abort(404)
    places = [place.to_dict() for place in city.places]
    return jsonify(places)


@app_views.route(
    '/places/<place_id>', methods=['GET'], strict_slashes=False
    )
def get_place(place_id):
    """Retrieve a Place object"""
    place = storage.get(Place, place_id)
    if not place:
        abort(404)
    return jsonify(place.to_dict())


@app_views.route(
    '/places/<place_id>', methods=['DELETE'], strict_slashes=False
    )
def delete_place(place_id):
    """Delete a Place object"""
    place = storage.get(Place, place_id)
    if not place:
        abort(404)
    storage.delete(place)
    storage.save()
    return jsonify({}), 200


@app_views.route(
    '/cities/<city_id>/places', methods=['POST'], strict_slashes=False
    )
def create_place(city_id):
    """Create a Place"""
    city = storage.get(City, city_id)
    if not city:
        abort(404)
    if not request.json:
        abort(400, description="Not a JSON")
    data = request.get_json()
    if 'user_id' not in data:
        abort(400, description="Missing user_id")
    user = storage.get(User, data['user_id'])
    if not user:
        abort(404)
    if 'name' not in data:
        abort(400, description="Missing name")
    data['city_id'] = city_id
    new_place = Place(**data)
    storage.new(new_place)
    storage.save()
    return jsonify(new_place.to_dict()), 201


@app_views.route('/places/<place_id>', methods=['PUT'], strict_slashes=False)
def update_place(place_id):
    """Update a Place object"""
    place = storage.get(Place, place_id)
    if not place:
        abort(404)
    if not request.json:
        abort(400, description="Not a JSON")
    data = request.get_json()
    ignore_keys = ['id', 'user_id', 'city_id', 'created_at', 'updated_at']
    for key, value in data.items():
        if key not in ignore_keys:
            setattr(place, key, value)
    storage.save()
    return jsonify(place.to_dict()), 200


@app_views.route('/places_search', methods=['POST'], strict_slashes=False)
def places_search():
    """
    Search for places based on states, cities, and amenities.
    """
    body_r = request.get_json()
    if body_r is None:
        abort(400, "Not a JSON")

    if not body_r or (
            not body_r.get('states') and
            not body_r.get('cities') and
            not body_r.get('amenities')
    ):
        places = storage.all(Place)
        return jsonify([place.to_dict() for place in places.values()])

    places = set()

    if 'states' in body_r:
        for state_id in body_r['states']:
            state = storage.get("State", state_id)
            if state:
                for city in state.cities:
                    places.update(city.places)

    if 'cities' in body_r:
        for city_id in body_r['cities']:
            city = storage.get("City", city_id)
            if city:
                places.update(city.places)

    if not places:
        places = set(storage.all(Place).values())

    if 'amenities' in body_r:
        amenities = {
            storage.get("Amenity", amenity_id)
            for amenity_id in body_r['amenities']
        }
        filtered_places = set()
        for place in places:
            place_amenities = {
                storage.get("Amenity", amenity.id)
                for amenity in place.amenities
            }
            if amenities.issubset(place_amenities):
                filtered_places.add(place)
        places = filtered_places

    return jsonify([place.to_dict() for place in places])
