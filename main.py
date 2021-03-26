# This Python file uses the following encoding: utf-8
import sys
import os
import pyttsx3
import wikipedia
import webbrowser
import datetime
import time
import speech_recognition as sr
import subprocess
import pyautogui
from PySide2.QtGui import QGuiApplication
from PySide2.QtQuick import QQuickView
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtWidgets import QApplication, QPushButton
from PySide2.QtCore import QObject, Signal, Slot


global var
global var1


class Alice(QObject):

    def __init__(self,parent=None):
        QObject.__init__(self, parent)
        self.r = sr.Recognizer()
        self.pyengine = pyttsx3.init('sapi5')
        self.voices = self.pyengine.getProperty('voices').setProperty('voice', voices[1].id)
        self.hour = int(datetime.datetime.now().hour)

    @Slot(str)
    def speak(self,audio):
        self.pyengine.say(audio)
        self.pyengine.runAndWait()


    def wishme(self):
        if 0 <= self.hour <= 12:
            self.speak("Good Morning sir")
        elif 12 <= self.hour <= 18:
            self.speak("Good Afternoon sir")
        else:
            self.speak("Good Evening sir")
        self.speak("Myself Alice! How may i help you sir")


    @Slot(str)
    def takeCommand(self):
        with sr.Microphone() as source:
            print("Listening....")
            self.r.pause_threshould = 1
            self.audio = self.listen(source)
        try:
            print("Recognizing")
            self.query = r.recognize_google(audio, language='en-in')
        except Exception as e:
            self.speak("Sir can you say that again")
            return "None"
        return self.query

















if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    alice = Alice()
    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("alice",alice)
    engine.load(os.path.join(os.path.dirname(__file__), "main.qml"))



    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
