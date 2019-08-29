import sys
from FeatureVector import generateFeatures
sys.path.append('../Classification')


f = '../../../../Dataset/setA/Atraining_normal/Atraining_normal/201108011114.wav'
d = '../Dataset/heartbeatFeaturesB4.csv'

X = generateFeatures(f,d)

print(X)