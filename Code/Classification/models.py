import pickle
import keras

def ANN():

    # Load and return ANN model

    ann = keras.models.load_model('../Models/ANN_B.h5')
   

    return ann


def SVM():

    # Load and return ANN model

    svm = open('../Models/SVM_B_P2.pkl', 'rb')
    svm = pickle.load(svm)

    return svm

def XGB():

    # Load and return XGB model

    xgb = open('../Models/XGB_B_P2.pkl', 'rb')
    xgb = pickle.load(xgb)

    return xgb