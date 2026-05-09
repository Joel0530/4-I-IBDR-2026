from flask import Flask, request
from flask_restful import Api, Resource
from flasgger import Swagger, swag_from

from MyDataBase import MyDatabase
from Constants import Constants
from CRUD import CRUD

app = Flask(__name__)
api = Api(app)

# Configuring Swagger
app.config['SWAGGER'] = {
    'title': 'My First REST API',
    'uiversion': 3
}
swagger = Swagger(app)

class Welcome(Resource):
    @swag_from({
        'responses': {
            200: {
                'description': 'A status code 200 means successful and returns a message.',
                'content': {
                    'application/json': {
                        'examples': {
                            'example1': {
                                'summary': 'Successful response',
                                'value': {'message': 'Welcome GeeksforGeeks!!'}
                            }
                        }
                    }
                }
            }
        }
    })
    def get(self):
        """
        This is an example endpoint which returns a simple message.
        """
        return {'message': 'Welcome Database Implementators!!'}

class Items(Resource):
    @swag_from({
        'responses': {
            200: {
                'description': 'A status code 200 means successful and returns a list of items.',
                'content': {
                    'application/json': {
                        'examples': {
                            'example1': {
                                'summary': 'Successful response',
                                'value': {'items': ['Item 1', 'Item 2', 'Item 3']}
                            }
                        }
                    }
                }
            }
        }
    })
    def get(self):
        """
        This endpoint returns a list of items.
        """
        crud = CRUD()
        #print(test.query("INSERT INTO mytest (id) VALUES (3)"))
        items = crud.testing()
        return {'items': items}

api.add_resource(Welcome, '/')
api.add_resource(Items, '/items')

if __name__ == '__main__':
    app.run(debug=True)