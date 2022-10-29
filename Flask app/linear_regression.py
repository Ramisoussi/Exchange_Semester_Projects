import numpy as np
import pandas as pd
from sklearn.preprocessing import MinMaxScaler
from sklearn import datasets, linear_model
from sklearn import svm


def score_prediction_linear_regression(list_of_attributes):
    df = pd.read_csv("nba_logreg.csv")

# extract names, labels, features names and values
    names = df['Name'].values.tolist() # players names
    labels = df['TARGET_5Yrs'].values # labels
    paramset = df.drop(['TARGET_5Yrs','Name'],axis=1).columns.values
    df_vals = df.drop(['TARGET_5Yrs','Name'],axis=1).values

    for x in np.argwhere(np.isnan(df_vals)):
        df_vals[x]=0.0


    scaler = MinMaxScaler()

    X = scaler.fit_transform(df_vals)

    reg = linear_model.LinearRegression()
 
    reg.fit(X, labels)

    scaled_list = scaler.transform(list_of_attributes)

    prediction = reg.predict(scaled_list)
    
    return (prediction)


def score_prediction_SVM(list_of_attributes):
    df = pd.read_csv("nba_logreg.csv")

    # extract names, labels, features names and values
    names = df['Name'].values.tolist()  # players names
    labels = df['TARGET_5Yrs'].values  # labels
    paramset = df.drop(['TARGET_5Yrs', 'Name'], axis=1).columns.values
    df_vals = df.drop(['TARGET_5Yrs', 'Name'], axis=1).values

    for x in np.argwhere(np.isnan(df_vals)):
        df_vals[x] = 0.0

    scaler = MinMaxScaler()

    X = scaler.fit_transform(df_vals)

    reg = svm.SVC()

    reg.fit(X, labels)

    scaled_list = scaler.transform(list_of_attributes)

    prediction = reg.predict(scaled_list)

    return (prediction)

