from flask import Flask, render_template , request, flash
from linear_regression import score_prediction_linear_regression , score_prediction_SVM
import numpy as np
import pandas as pd




app = Flask(__name__)
app.config['SECRET_KEY'] = '1234'

@app.route('/')
def index():
    return render_template('index.html')



@app.route('/linear_regression', methods=['GET', 'POST'])
def linear_regression():
    list_of_attributes = []
    prediction =  ''
    threshold = 0.5
    if request.method == 'POST':
        f = request.form
        for key in f.keys():
            for value in f.getlist(key):
                list_of_attributes.append(value)

        all_numbers = True
        for i in range(len(list_of_attributes[1:])):
            if list_of_attributes[1:][i].replace('.', '', 1).isdigit() == False : all_numbers = False

        if all_numbers == False:
            flash('Missing input!')
        else :
            threshold = float(list_of_attributes[0])
            score = score_prediction_linear_regression(np.array(list_of_attributes[1:]).reshape(1, -1))

            if score < threshold:
                prediction = 'This player is bad'
            else:
                prediction = 'This player is good'

    return render_template('linear_regression.html', sum=prediction)


@app.route('/svm', methods=['GET', 'POST'])
def SVM():
    list_of_attributes = []
    prediction = ''
    threshold = 0.5
    if request.method == 'POST':
        f = request.form
        for key in f.keys():
            for value in f.getlist(key):
                list_of_attributes.append(value)

        all_numbers = True
        for i in range(len(list_of_attributes)):
            if list_of_attributes[i].replace('.', '', 1).isdigit() == False: all_numbers = False

        if all_numbers == False:
            flash('Missing input!')
        else:
            score = score_prediction_SVM(np.array(list_of_attributes).reshape(1, -1))

            if int(score) == 0:
                prediction = 'This player is bad'
            else:
                prediction = 'This player is good'

    return render_template('svm.html', sum=prediction)


@app.route('/table', methods=['GET', 'POST'])
def table():
    number_of_players = 5
    if request.method == 'POST':
        f = request.form
        input = request.form['num1']
        if not input.isdigit():
            flash('Enter valid number!')
        else : number_of_players = int(input)

    df = pd.read_csv("nba_logreg.csv")


    return render_template('table.html', df = df.head(number_of_players))






