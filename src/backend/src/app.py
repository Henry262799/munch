from db import db
from flask import Flask, request
import json

# main.db file should be on the docker image and hosted on the server. 
# Access should not be a public repository for security.
app = Flask(__name__)
db_filename = "main.db"

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///%s" % db_filename
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

db.init_app(app)
with app.app_context():
    db.drop_all()
    db.create_all()