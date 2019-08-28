import pandas as pd
import matlab.engine


def getFeatures(filename):
    
    eng = matlab.engine.start_matlab()
    features = eng.GenerateFeatures(filename)
    return features

df = pd.read_csv('../Dataset/heartbeatFeaturesB4.csv')
toremove = df.shape[1] -1 
df = df.iloc[:, 0:toremove]
print(df.head())
#print(getFeatures('../../../../Dataset/setA/Atraining_normal/Atraining_normal/201108011114.wav'))