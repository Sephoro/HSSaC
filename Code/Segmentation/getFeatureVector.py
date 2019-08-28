import numpy as np # Tradition
import matlab.engine


eng = matlab.engine.start_matlab()
tf = eng.GenerateFeatures('../../../../Dataset/setA/Atraining_normal/Atraining_normal/201108011114.wav')
print(tf)
