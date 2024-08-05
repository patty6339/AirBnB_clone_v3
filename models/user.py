#!/usr/bin/python3
""" holds class User"""
from os import getenv
import models
import sqlalchemy
from models.base_model import BaseModel, Base
from sqlalchemy import Column, String
from sqlalchemy.orm import relationship


class User(BaseModel, Base):
    """Representation of a user """
    if models.storage_t == 'db':
        __tablename__ = 'users'
        email = Column(String(128), nullable=False)
        password = Column(String(128), nullable=False)
        first_name = Column(String(128), nullable=True)
        last_name = Column(String(128), nullable=True)
        places = relationship("Place", backref="users")
        reviews = relationship("Review", backref="user")
    else:
        email = ""
        password = ""
        first_name = ""
        last_name = ""

    def __init__(self, *args, **kwargs):
        """initializes user"""
        super().__init__(*args, **kwargs)
        if 'password' in kwargs:
            self.password = kwargs['password']

    @property
    def password(self):
        """Getter for password"""
        return self._password

    @password.setter
    def password(self, value):
        """Setter for password, hashes the password before storing"""
        self._password = hashlib.md5(value.encode()).hexdigest()

    def __str__(self):
        """Returns a string representation of the User instance"""
        return "[User] ({}) {}".format(self.id, self.__dict__)
