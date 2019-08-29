import sys
from FeatureVector import generateFeatures
sys.path.append('../Classification')


class Classifier:
    def __init__(self, modelName, filedir):
        self.modelName = modelName
        self.filedir = filedir
        self.datasetDir = '../Dataset/heartbeatFeaturesB4.csv'
    
    def getFeatures(self):

        self.featureVector = generateFeatures(self.filedir,self.datasetDir)

        return self.featureVector
    




f = '../../../../Dataset/setA/Atraining_normal/Atraining_normal/201108011114.wav'

c = Classifier('ANN', f)

X = c.getFeatures()

print(X)