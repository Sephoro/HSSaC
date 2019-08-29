import pandas as pd
import numpy as np
import matlab.engine
from sklearn.preprocessing import MinMaxScaler


def getRawFeatures(filename):
    
    #Generate initial feature vector of filename

    eng = matlab.engine.start_matlab()
    future  = eng.GenerateFeatures(filename,async=True) #background=True
    features = future.result()
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

    # Rename the columns correctly
    x.columns = ['stdPCA1', 'stdPCA2', 'stdPCA3', 'meanPCA1', 
                 'meanPCA2', 'meanPCA3', 'meanS1', 'meanS2', 
                 'stdS1', 'stdS2','rebuilError', 'ratios','stdFFTSHA' ,
                 'lenFFTSHA', 'stdlenFFTSHA' ,'lenstdFFTSHA' ,'posFFT',
                 'minstdS1', 'maxstdS1', 'mmstdS1', 'minstdS2' , 'maxstdS2',
                 'mmstdS2','posRatio', 'stdWavelet', 'meanWavelet']
    
    # This features are only for dataset B
    # TODO: Cater for both datasets
    
    features = x.iloc[:,0:17]
    features[['maxstdS1', 'maxstdS2', 'mmstdS1', 'mmstdS2']] = x[['maxstdS1', 'maxstdS2','mmstdS1', 'mmstdS2']]
    features[['posRatio','stdWavelet','meanWavelet']] = x[['posRatio','stdWavelet','meanWavelet']]
    
    # The first element is the desired one
    return features.iloc[0:1,:]