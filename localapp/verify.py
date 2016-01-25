#!/usr/bin/python

import sys
from PyQt4 import QtCore, QtGui, uic
from PyQt4.QtGui import QListWidgetItem
import urllib
import json
import datetime

form_class = uic.loadUiType("verify.ui")[0]


class MyWindowClass(QtGui.QMainWindow, form_class):
    def __init__(self, parent=None):
        QtGui.QMainWindow.__init__(self, parent)
        self.setupUi(self)
        self.btn_go.clicked.connect(self.btn_go_clicked)
        self.txt_url.returnPressed.connect(self.btn_go_clicked)
        url = "https://shielded-temple-2761.herokuapp.com/ingresso.json"
        response = urllib.urlopen(url)
        self.data = json.loads(response.read())
        print self.data

    def btn_go_clicked(self):
        code = self.txt_url.text().toUpper()
        print code
        texto = ""
        for item in self.data:
            if item["code"] == code:
                if item["entrada"] is None:
                    texto = item["code"] + " aceito."
                    item["entrada"] = datetime.datetime.now
                else:
                    texto = item["code"] + " ja utilizado."
        if texto == "":
            texto = item["code"] + " nao e valido."

        now = unicode(datetime.datetime.now())
        item = QListWidgetItem(texto + " \t: " + now)
        self.log.addItem(item)
        self.log.setItemSelected(item, True)
        self.log.scrollToItem(item)
        self.txt_url.clear()

app = QtGui.QApplication(sys.argv)
myWindow = MyWindowClass(None)
myWindow.show()
app.exec_()
