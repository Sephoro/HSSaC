import matlab.engine


def getFeatures(filename):
    
    eng = matlab.engine.start_matlab()
    features = eng.GenerateFeatures(filename)
    return features

print(getFeatures('../../../../Dataset/setA/Atraining_normal/Atraining_normal/201108011114.wav'))