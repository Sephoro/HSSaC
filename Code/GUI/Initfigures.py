import matlab.engine

""" Generate the first plot for the GUI """


def generateInitFigures(filename):
    
    """ Generate plots for the GUI """
    
    # Generate initial figures
    eng = matlab.engine.start_matlab()
    eng.cd(r'../Segmentation')
    eng.InitialPlots(filename,nargout=0) 


generateInitFigures('/home/elias/Dropbox/YOS4/ELEN4012/Dataset/setA/Aunlabelledtest/Aunlabelledtest/201101152256.wav')
