import pandas as pd
import numpy as np
import matlab.engine
from sklearn.preprocessing import MinMaxScaler


def getFeatures(filename):
    
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
    # X[['maxstdS1','maxstdS2','mmstdS1','mmstdS2']] = df[['maxstdS1','maxstdS2','mmstdS1','mmstdS2']]
    # X[['posRatio','stdWavelet','meanWavelet']] = df[['posRatio','stdWavelet','meanWavelet']]

    return X
def normalise(filename, dataset):
    
    # Normalise and return ready for classification
    a = getFeatures(filename)
    b = getOriginalInputs(dataset).values
    print(a)
    print(b)
    # Concate and ready for normalisation
    b = np.concatenate((a,b))
    # print(X)
    # Normalise
    # min_max_scaler = MinMaxScaler()
    # x_scaled = min_max_scaler.fit_transform(X)
    # X = pd.DataFrame(x_scaled)
    # x =  X [0,0:26]
    return b



f = '../../../../Dataset/setA/Atraining_normal/Atraining_normal/201108011114.wav'
d = '../Dataset/heartbeatFeaturesB4.csv'

X = normalise(f,d)
print(X)

# a = getFeatures('../../../../Dataset/setA/Atraining_normal/Atraining_normal/201108011114.wav')
# filename = '../Dataset/heartbeatFeaturesB4.csv'
# b = getOriginalInputs(filename).values
# print(b)
# print('\n\n\n')
# b = np.concatenate((a, b))

# print(a)
# print('\n\n\n')
# print(b)
# print(b.shape)