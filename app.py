import pickle
from flask import Flask,render_template,request,app,jsonify,url_for
import numpy as np
import pandas as pd

app = Flask(__name__)

## Load the model
model = pickle.load(open('model.pkl','rb'))
scaler = pickle.load(open('scaler.pkl','rb'))

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/predict_api',methods=['POST'])

def predict_api():
    data = request.json['data']
    print(data)
    new_data = scaler.transform(np.array(list(data.values())).reshape(1,-1))
    output = model.predict(new_data)
    print(output[0])
    response  = jsonify(int(output[0]))
    return response

@app.route('/predict',methods=['POST'])
def predict():
    data = [float(x) for x in request.form.values()]
    final_input = scaler.transform(np.array(data).reshape(1,-1))
    print(final_input)
    output = model.predict(final_input)[0]
    if output==0.0:
        return render_template("home.html",prediction_text="The predicted Potability Index is {}, hence the water is not drinkable".format(output))
    elif output==1.0:
        return render_template("home.html",prediction_text="The predicted Potability Index is {}, hence the water is drinkable".format(output))



if __name__ == "__main__":
    app.run(debug=True)
