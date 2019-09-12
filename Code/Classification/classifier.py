import sys
import numpy as np

import models as md # Models to be used

sys.path.append('../Segmentation')
from FeatureVector import generateFeatures



class Classifier:
    def __init__(self):
       
        self.datasetDir = '../Dataset/heartbeatFeaturesB4.csv'
    
    def generateFeatures(self, filedir):

        self.filedir = filedir

        self.featureVector = generateFeatures(self.filedir,self.datasetDir)
        print(self.featureVector)

    
    def classify(self,modelName):
        
        self.modelName = modelName

        # Classes to be predicted

        classes = np.array(['Extrasystole', 'Murmur', 'Normal'])

        # Classify the heartsound
        if self.modelName == 'ANN':
            ANN = md.ANN()
            result = ANN.predict_proba(self.featureVector)
            #print(result)

        elif self.modelName == 'XGB':

            XGB = md.XGB()
            result = XGB.predict_proba(self.featureVector)

        elif self.modelName == 'SVM':

            SVM = md.SVM()
            result = SVM.predict_proba(self.featureVector)
            #print(result)
    
        confidence = max(result[0])
        class_ = (classes[np.where(result[0] ==  confidence)])[0]

        return class_ , confidence*100