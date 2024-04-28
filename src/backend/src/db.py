from flask_sqlalchemy import SQLAlchemy

# Default metadata object will be used after since no metadata variable is supplied initially
db = SQLAlchemy()

class User(db.Model):
    """
        ORM model for Users
    """

    __tablename__= "user"
    id= db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name= db.Column(db.String, nullable=False)
    last_name= db.Column(db.String, nullable=False)
    username= db.Column(db.String, nullable=False)
    posts = db.relationship('Post', backref='user', lazy=True)
    saved_posts = db.relationship('Post', secondary='saved_posts', lazy='subquery',
                                  backref=db.backref('saved_by', lazy=True))



    def __init__(self, **kwargs):
        self.first_name= kwargs.get("first_name")
        self.last_name= kwargs.get("last_name")
        self.username= kwargs.get("username")
    
    def serialize(self):
        return {
            'id': self.id,
            'first name': self.first_name,
            'last name': self.last_name,
            'username': self.username
        }


class Post(db.Model):
    """
        ORM model for a Post
    """

    __tablename__="post"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    title = db.Column(db.String, nullable=False)
    ingredients = db.Column(db.String, nullable=False)
    image = db.Column(db.String, nullable=False)
    meal_type = db.Column(db.String, nullable=False)
    difficulty = db.Column(db.String, nullable=False)
    date = db.Column(db.String, nullable=False)
    likes = db.Column(db.Integer, nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey("user.id"))
    comments = db.relationship('Comment', backref='post', lazy=True, cascade='all, delete-orphan')


    def __init__(self, **kwargs):
        self.title= kwargs.get("title")
        self.ingredients= kwargs.get("ingredients")
        self.image= kwargs.get("image")
        self.meal_type= kwargs.get("meal_type")
        self.difficulty = kwargs.get("difficulty")
        self.date= kwargs.get("date")       # date format?
        self.user_id= kwargs.get("user_id")
        self.likes= kwargs.get("likes")
    
    def serialize(self):
        return {
            'id': self.id,
            'title': self.title,
            'ingredients': self.ingredients,
            'image': self.image,
            'meal_type': self.meal_type,
            'difficulty': self.difficulty,
            'date': self.date,
            'user_id': self.user_id,
            'likes': self.likes,
            'comments': [comment.serialize() for comment in self.comments]
        }

class Comment(db.Model):
    """
        ORM model for comment
    """

    __tablename__= "comment"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    post_id = db.Column(db.Integer, db.ForeignKey("post.id"), nullable=False)
    author_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    date = db.Column(db.String, nullable=False)
    message = db.Column(db.String, nullable=False)


    def __init__(self, **kwargs):
        self.message = kwargs.get("message")
        self.post_id = kwargs.get("post_id")
        self.author_id = kwargs.get("author_id")
        self.date = kwargs.get("date")

    def serialize(self):
        return {
            'id': self.id,
            'post_id': self.post_id,
            'author_id': self.author_id,
            'date': self.date,
            'message': self.message,
        }


class SavedPost(db.Model):
    __tablename__ = 'saved_posts'
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), primary_key=True)
    post_id = db.Column(db.Integer, db.ForeignKey('posts.id'), primary_key=True)


class MealPlan(db.Model):
    __tablename__ = 'meal_plans'
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'))
    post_id = db.Column(db.Integer, db.ForeignKey('posts.id'))
    plan_type = db.Column(db.String, nullable=False)
    plan_date = db.Column(db.String, nullable=False)

    def serialize(self):
        return {
            'id': self.id,
            'user_id': self.user_id,
            'post_id': self.post_id,
            'meal_type': self.plan_type,
            'date': self.plan_date
        }
