# Flask 
from flask import Flask, app

from chat import ember
from flask import request
app=Flask(__name__)


@app.route('/question',methods=['POST'])
def ques():
    sentence=request.data

    if sentence=="":
        result = "Error: Empty String"
        return result
    try:
        result=ember(sentence)
    except:
        err="Error in interpretation"
        return err 
        
    return result