import matlab.engine

""" Generate the first plot for the GUI """


def generateInitFigures(filename):
    
    """ Generate plots for the GUI """
    
    # Generate initial figures
    eng = matlab.engine.start_matlab()
    eng.InitialPlots(filename,nargout=0) 
