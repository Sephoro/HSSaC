# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'L2H.ui'
#
# Created by: PyQt5 UI code generator 5.12.1
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets
import os


class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(1259, 1016)
        MainWindow.setStyleSheet("background-color: rgb(0, 0, 0);")
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.loadBtn = QtWidgets.QPushButton(self.centralwidget)
        self.loadBtn.setGeometry(QtCore.QRect(1090, 30, 131, 25))
        self.loadBtn.setStyleSheet("background-color: rgb(52, 101, 164);\n"
"")
        self.loadBtn.setObjectName("loadBtn")
        self.directory = QtWidgets.QLineEdit(self.centralwidget)
        self.directory.setGeometry(QtCore.QRect(480, 30, 581, 25))
        self.directory.setStyleSheet("background-color: rgb(255, 255, 255);\n"
"background-color: rgb(186, 189, 182);")
        self.directory.setObjectName("directory")
        self.sig1H = QtWidgets.QLineEdit(self.centralwidget)
        self.sig1H.setGeometry(QtCore.QRect(40, 90, 121, 25))
        self.sig1H.setStyleSheet("color: rgb(238, 238, 236);\n"
"font: 13pt \"Ubuntu\";")
        self.sig1H.setObjectName("sig1H")
        self.fft1H = QtWidgets.QLineEdit(self.centralwidget)
        self.fft1H.setGeometry(QtCore.QRect(650, 90, 113, 25))
        self.fft1H.setStyleSheet("color: rgb(238, 238, 236);\n"
"font: 13pt \"Ubuntu\";")
        self.fft1H.setObjectName("fft1H")
        self.title = QtWidgets.QLabel(self.centralwidget)
        self.title.setGeometry(QtCore.QRect(110, 30, 331, 31))
        self.title.setStyleSheet("color: rgb(186, 189, 182);\n"
"font: 75 26pt \"TeX Gyre Adventor\";\n"
"\n"
"")
        self.title.setObjectName("title")
        self.sig1 = QtWidgets.QLabel(self.centralwidget)
        self.sig1.setGeometry(QtCore.QRect(40, 120, 571, 251))
        self.sig1.setStyleSheet("background-color: rgb(46, 52, 54);")
        self.sig1.setText("")
        self.sig1.setObjectName("sig1")
        self.fft1 = QtWidgets.QLabel(self.centralwidget)
        self.fft1.setGeometry(QtCore.QRect(650, 120, 571, 251))
        self.fft1.setStyleSheet("background-color: rgb(255, 255, 255);\n"
"background-color: rgb(46, 52, 54);")
        self.fft1.setText("")
        self.fft1.setObjectName("fft1")
        self.play1Btn = QtWidgets.QPushButton(self.centralwidget)
        self.play1Btn.setGeometry(QtCore.QRect(480, 90, 131, 25))
        self.play1Btn.setStyleSheet("background-color: rgb(52, 101, 164);")
        self.play1Btn.setObjectName("play1Btn")
        self.denoiseBtn = QtWidgets.QPushButton(self.centralwidget)
        self.denoiseBtn.setGeometry(QtCore.QRect(1090, 90, 131, 25))
        self.denoiseBtn.setStyleSheet("background-color: rgb(115, 210, 22);")
        self.denoiseBtn.setObjectName("denoiseBtn")
        self.peaksBtn = QtWidgets.QPushButton(self.centralwidget)
        self.peaksBtn.setGeometry(QtCore.QRect(1090, 390, 131, 25))
        self.peaksBtn.setStyleSheet("background-color: rgb(115, 210, 22);")
        self.peaksBtn.setObjectName("peaksBtn")
        self.fft2 = QtWidgets.QLabel(self.centralwidget)
        self.fft2.setGeometry(QtCore.QRect(650, 420, 571, 251))
        self.fft2.setStyleSheet("background-color: rgb(46, 52, 54);")
        self.fft2.setText("")
        self.fft2.setObjectName("fft2")
        self.sig2 = QtWidgets.QLabel(self.centralwidget)
        self.sig2.setGeometry(QtCore.QRect(40, 420, 571, 251))
        self.sig2.setStyleSheet("background-color: rgb(46, 52, 54);")
        self.sig2.setText("")
        self.sig2.setObjectName("sig2")
        self.peaksgraph = QtWidgets.QLabel(self.centralwidget)
        self.peaksgraph.setGeometry(QtCore.QRect(40, 720, 571, 251))
        self.peaksgraph.setStyleSheet("background-color: rgb(46, 52, 54);")
        self.peaksgraph.setText("")
        self.peaksgraph.setObjectName("peaksgraph")
        self.featuresBtn = QtWidgets.QPushButton(self.centralwidget)
        self.featuresBtn.setGeometry(QtCore.QRect(480, 690, 131, 25))
        self.featuresBtn.setStyleSheet("background-color: rgb(115, 210, 22);")
        self.featuresBtn.setObjectName("featuresBtn")
        self.classificationH = QtWidgets.QLineEdit(self.centralwidget)
        self.classificationH.setGeometry(QtCore.QRect(900, 830, 141, 25))
        self.classificationH.setStyleSheet("color: rgb(238, 238, 236);\n"
"font: 75 11pt \"Ubuntu Condensed\";\n"
"font: 15pt \"Ubuntu\";")
        self.classificationH.setObjectName("classificationH")
        self.play2Btn = QtWidgets.QPushButton(self.centralwidget)
        self.play2Btn.setGeometry(QtCore.QRect(480, 390, 131, 25))
        self.play2Btn.setStyleSheet("background-color: rgb(52, 101, 164);")
        self.play2Btn.setObjectName("play2Btn")
        self.fft2H = QtWidgets.QLineEdit(self.centralwidget)
        self.fft2H.setGeometry(QtCore.QRect(650, 390, 113, 25))
        self.fft2H.setStyleSheet("color: rgb(238, 238, 236);\n"
"font: 13pt \"Ubuntu\";")
        self.fft2H.setObjectName("fft2H")
        self.sig2H = QtWidgets.QLineEdit(self.centralwidget)
        self.sig2H.setGeometry(QtCore.QRect(40, 390, 131, 25))
        self.sig2H.setStyleSheet("color: rgb(238, 238, 236);\n"
"font: 13pt \"Ubuntu\";")
        self.sig2H.setObjectName("sig2H")
        self.selectmodelH = QtWidgets.QLineEdit(self.centralwidget)
        self.selectmodelH.setGeometry(QtCore.QRect(650, 850, 113, 25))
        self.selectmodelH.setStyleSheet("color: rgb(238, 238, 236);\n"
"font: 13pt \"Ubuntu\";")
        self.selectmodelH.setObjectName("selectmodelH")
        self.testaccuracyH = QtWidgets.QLineEdit(self.centralwidget)
        self.testaccuracyH.setGeometry(QtCore.QRect(1030, 880, 111, 25))
        self.testaccuracyH.setStyleSheet("color: rgb(238, 238, 236);\n"
"font: 13pt \"Ubuntu\";")
        self.testaccuracyH.setObjectName("testaccuracyH")
        self.classH = QtWidgets.QLineEdit(self.centralwidget)
        self.classH.setGeometry(QtCore.QRect(850, 880, 113, 25))
        self.classH.setStyleSheet("color: rgb(238, 238, 236);\n"
"font: 13pt \"Ubuntu\";")
        self.classH.setObjectName("classH")
        self.accuracy = QtWidgets.QLineEdit(self.centralwidget)
        self.accuracy.setGeometry(QtCore.QRect(1030, 930, 111, 25))
        self.accuracy.setStyleSheet("background-color: rgb(186, 189, 182);")
        self.accuracy.setObjectName("accuracy")
        self.class_2 = QtWidgets.QLineEdit(self.centralwidget)
        self.class_2.setGeometry(QtCore.QRect(850, 930, 151, 25))
        self.class_2.setStyleSheet("background-color: rgb(186, 189, 182);")
        self.class_2.setPlaceholderText("")
        self.class_2.setObjectName("class_2")
        self.comboBox = QtWidgets.QComboBox(self.centralwidget)
        self.comboBox.setGeometry(QtCore.QRect(650, 880, 121, 25))
        self.comboBox.setStyleSheet("background-color: rgb(186, 189, 182);")
        self.comboBox.setObjectName("comboBox")
        self.comboBox.addItem("")
        self.comboBox.addItem("")
        self.comboBox.addItem("")
        self.evaluateBtn = QtWidgets.QPushButton(self.centralwidget)
        self.evaluateBtn.setGeometry(QtCore.QRect(650, 930, 141, 25))
        self.evaluateBtn.setStyleSheet("background-color: rgb(164, 0, 0);\n"
"")
        self.evaluateBtn.setObjectName("evaluateBtn")
        self.logo = QtWidgets.QLabel(self.centralwidget)
        self.logo.setGeometry(QtCore.QRect(40, 10, 61, 61))
        self.logo.setText("")
        self.logo.setPixmap(QtGui.QPixmap("heartpic.png"))
        self.logo.setScaledContents(True)
        self.logo.setObjectName("logo")
        self.features = QtWidgets.QTableView(self.centralwidget)
        self.features.setGeometry(QtCore.QRect(650, 720, 571, 91))
        self.features.setStyleSheet("background-color: rgb(46, 52, 54);")
        self.features.setObjectName("features")
        self.sig2H_2 = QtWidgets.QLineEdit(self.centralwidget)
        self.sig2H_2.setGeometry(QtCore.QRect(40, 690, 131, 25))
        self.sig2H_2.setStyleSheet("color: rgb(238, 238, 236);\n"
"font: 13pt \"Ubuntu\";")
        self.sig2H_2.setObjectName("sig2H_2")
        self.sig2H_3 = QtWidgets.QLineEdit(self.centralwidget)
        self.sig2H_3.setGeometry(QtCore.QRect(650, 690, 151, 25))
        self.sig2H_3.setStyleSheet("color: rgb(238, 238, 236);\n"
"font: 13pt \"Ubuntu\";")
        self.sig2H_3.setObjectName("sig2H_3")
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 1259, 22))
        self.menubar.setObjectName("menubar")
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "MainWindow"))
        self.loadBtn.setText(_translate("MainWindow", "Load Signal"))
        self.directory.setPlaceholderText(_translate("MainWindow", "Directory"))
        self.sig1H.setText(_translate("MainWindow", "Original Signal"))
        self.fft1H.setText(_translate("MainWindow", "FFT"))
        self.title.setText(_translate("MainWindow", "Listen to your Heart"))
        self.play1Btn.setText(_translate("MainWindow", "Play Sound"))
        self.denoiseBtn.setText(_translate("MainWindow", "Denoise Signal"))
        self.peaksBtn.setText(_translate("MainWindow", "Peak Detection"))
        self.featuresBtn.setText(_translate("MainWindow", "Feature Extraction"))
        self.classificationH.setText(_translate("MainWindow", "Classification"))
        self.play2Btn.setText(_translate("MainWindow", "Play Sound"))
        self.fft2H.setText(_translate("MainWindow", "FFT"))
        self.sig2H.setText(_translate("MainWindow", "Denoised Signal"))
        self.selectmodelH.setText(_translate("MainWindow", "Select Model:"))
        self.testaccuracyH.setText(_translate("MainWindow", "Confidence:"))
        self.classH.setText(_translate("MainWindow", "Class"))
        self.accuracy.setPlaceholderText(_translate("MainWindow", "%"))
        self.comboBox.setItemText(0, _translate("MainWindow", "ANN"))
        self.comboBox.setItemText(1, _translate("MainWindow", "SVM"))
        self.comboBox.setItemText(2, _translate("MainWindow", "XGBoost"))
        self.evaluateBtn.setText(_translate("MainWindow", "Evaluate Model"))
        self.sig2H_2.setText(_translate("MainWindow", "Detected Peaks"))
        self.sig2H_3.setText(_translate("MainWindow", "Extracted Features"))
        
        
        #implemntation of features in gui
        self.play1Btn.clicked.connect(self.playOriginalsignal)
        self.loadBtn.clicked.connect(self.originalsignal)
        self.denoiseBtn.clicked.connect(self.Denoisedsignal)
        
    
    #Play the original signal    
    def playOriginalsignal(self):
                
        sound = '/home/boikanyo/Dropbox/YOS4/ELEN4012/Dataset/setA/Atraining_normal/Atraining_normal/201108011114.wav'
        os.system("aplay " + sound +"&")
        
    #upload original signal and its fft when load button is pressed    
    def originalsignal(self):
           
        pixmap = QtGui.QPixmap("/home/boikanyo/Dropbox/YOS4/ELEN4012/Submissions/HSA/Code/Figures/OriginalSignal.png")
        pixmap = pixmap.scaled(pixmap.width(), self.sig1.height(), QtCore.Qt.KeepAspectRatioByExpanding, QtCore.Qt.SmoothTransformation)
        self.sig1.setPixmap(pixmap)
        
        pixmap1 = QtGui.QPixmap("/home/boikanyo/Dropbox/YOS4/ELEN4012/Submissions/HSA/Code/Figures/fftOrig.png")
        pixmap1 = pixmap1.scaled(pixmap1.width(), self.fft1.height(), QtCore.Qt.KeepAspectRatioByExpanding, QtCore.Qt.SmoothTransformation)
        self.fft1.setPixmap(pixmap1)
    
    #upload denoised signal  and its fft when denoised button is pressed       
    def Denoisedsignal(self):
           
        pixmap = QtGui.QPixmap("/home/boikanyo/Dropbox/YOS4/ELEN4012/Submissions/HSA/Code/Figures/DenoisedSignal.png")
        pixmap = pixmap.scaled(pixmap.width(), self.sig2.height(), QtCore.Qt.KeepAspectRatioByExpanding, QtCore.Qt.SmoothTransformation)
        self.sig2.setPixmap(pixmap)
        
        pixmap1 = QtGui.QPixmap("/home/boikanyo/Dropbox/YOS4/ELEN4012/Submissions/HSA/Code/Figures/fftDenoised.png")
        pixmap1 = pixmap1.scaled(pixmap1.width(), self.fft2.height(), QtCore.Qt.KeepAspectRatioByExpanding, QtCore.Qt.SmoothTransformation)
        self.fft2.setPixmap(pixmap1)
    


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    MainWindow = QtWidgets.QMainWindow()
    ui = Ui_MainWindow()
    ui.setupUi(MainWindow)
    MainWindow.show()
    sys.exit(app.exec_())
