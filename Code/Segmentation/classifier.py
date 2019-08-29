import sys
import numpy as np
from FeatureVector import generateFeatures
sys.path.append('../Classification')
import models as md # Models to be used


class Classifier:
    def __init__(self, modelName, filedir):
        self.modelName = modelName
        self.filedir = filedir
        self.datasetDir = '../Dataset/heartbeatFeaturesB4.csv'
    
    def getFeatures(self):

        self.featureVector = generateFeatures(self.filedir,self.datasetDir)

        # return self.featureVector
    
    def classify(self):
        
        # Classes to be predicted

        classes = np.array(['Extrasystole', 'Murmur', 'Normal'])

        # Classify the heartsound
        if self.modelName == 'ANN':
            ANN = md.ANN()
            result = ANN.predict_proba(self.featureVector)
            print(result)

        elif self.modelName == 'XGB':

            XGB = md.XGB()
            result = XGB.predict_proba(self.featureVector)

        elif self.modelName == 'SVM':

            SVM = md.SVM()
            result = SVM.predict_proba(self.featureVector)
            print(result)
    
        confidence = max(result[0])
        class_ = (classes[np.where(result[0] ==  confidence)])[0]
        
        return class_ , confidence*100
        

    




f = '../../../../Dataset/setA/Atraining_normal/Atraining_normal/201108011114.wav'

c = Classifier('SVM', f)

c.getFeatures()
c.classify()