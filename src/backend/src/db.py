from flask_sqlalchemy import SQLAlchemy

# Default metadata object will be used after since no metadata variable is supplied initially
db = SQLAlchemy()

# Classes here per table and column
class User(db.model):
    """
        ORM model for Users
    """

    __tablename__= "user"
    id= db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name= db.Column(db.String, nullable=False)
    last_name= db.Column(db.String, nullable=False)
    username= db.Column(db.String, nullable=False)

    def __init__(self, **kwargs):
        self.first_name= kwargs.get("first_name")
        self.last_name= kwargs.get("last_name")
        self.username= kwargs.get("username")
    
    def serialize(self):
        pass

class Post(db.model):
    """
        ORM model for a Post
    """

    __tablename__="post"
    id=db.Column(db.Integer, primary_key=True, autoincrement=True)
    title= db.Column(db.String, nullable=False)
    ingredients= db.Column(db.String, nullable=False)
    image= db.Column(db.String, nullable=False)
    meal_type= db.Column(db.String, nullable=False)
    date= db.Column(db.String, nullable=False)
    likes= db.Column(db.Integer, nullable=False)
    user_id= db.Column(db.Integer, db.ForeignKey("user.id"))

    def __init__(self, **kwargs):
        title= kwargs.get("title")
        ingredients= kwargs.get("ingredients")
        image= kwargs.get("image")
        meal_type= kwargs.get("meal_type")
        date= kwargs.get("date")
        likes= kwargs.get("likes")
        user_id= kwargs.get("user_id")
    
    def serialize(self):
        pass

class Comment(db.Model):
    """
        ORM model for comment
    """

    __tablename__= "comment"
    id= db.Column(db.Integer, primary_key=True, autoincrement=True)
    message= db.Column(db.Integer, nullable=False)
    post_id= db.Column(db.Integer, db.ForeignKey("post.id"))

    def __init__(self, **kwargs):
        self.message= kwargs.get("message")
        self.post_id= kwargs.get("post_id")

    def serialize(self):
        pass


