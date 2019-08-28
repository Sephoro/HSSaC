import pandas as pd
import numpy as np
import matlab.engine
from sklearn.preprocessing import MinMaxScaler


def getRawFeatures(filename):
    
    #Generate initial feature vector of filename

    eng = matlab.engine.start_matlab()
    features = eng.GenerateFeatures(filename)

    return features

def getOriginalInputs(filename):

    df = pd.read_csv(filename)

    # Remove the corrupted column
    toremove = df.shape[1] -1 
    df = df.iloc[:, 0:toremove]
    
    # Exclude the labels, not necessary
    X = df.iloc[0:3,0:26]

    return X

def generateFeatures(filename, dataset):
    
    # Normalise and return ready for classification
    a = getRawFeatures(filename)
    b = getOriginalInputs(dataset).values
    # print(a)
    # print(b)
    # Concate and ready for normalisation
    b = np.concatenate((a,b))
    # print('\n\n')
    # print(b)
    # Normalise
    min_max_scaler = MinMaxScaler()
    x_scaled = min_max_scaler.fit_transform(b)
    x = pd.DataFrame(x_scaled)
    
    # The top one is the one
    return x.iloc[0:1,0:26]



f = '../../../../Dataset/setA/Atraining_normal/Atraining_normal/201108011114.wav'
d = '../Dataset/heartbeatFeaturesB4.csv'

X = generateFeatures(f,d)
print(X)
