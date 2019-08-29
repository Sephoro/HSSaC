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
    X = df.iloc[:,0:26]

    return X

def generateFeatures(filename, dataset):
    
    # Normalise and return ready for classification
    a = getRawFeatures(filename)
    b = getOriginalInputs(dataset).values
    b = np.concatenate((a,b))
    min_max_scaler = MinMaxScaler()
    x_scaled = min_max_scaler.fit_transform(b)
    x = pd.DataFrame(x_scaled)

    return x.iloc[0:1,0:26]