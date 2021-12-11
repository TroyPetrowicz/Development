import tkinter
from time import sleep
import ctypes
from tkinter import *
from tkinter import ttk

class App():
    def __init__(self):
        global entry1
        self.root = tkinter.Tk()
        self.root.geometry("300x150")
        
        #Initialize a Label to display the User Input
        label2 = Label(self.root, text="Hours to Run", font=("Courier 12 bold"))
        label2.pack()

        #Create an Entry widget to accept User Input
        entry1 = Entry(self.root, width=30)
        entry1.focus_set()
        entry1.pack()

        self.root.bind("<Return>", self.run)
        
        tkinter.Button(self.root, text = 'Run', command=self.run).pack()
        tkinter.Button(self.root, text = 'Close', command=self.close).pack()
        
        self.root.mainloop()

    def run(self, event=None):
        global userinput1
        global calc1
        global calc2  
        global count 
        userinput1 = entry1.get()

        if userinput1 == "":
            userinput1 = 1
        else:
            userinput1 = float(entry1.get())
        self.root.destroy()
        calc1 = int(round((userinput1 * 60) * 60))

        user32 = ctypes.windll.user32

        interval = 60
        calc2 = int(round(calc1 / interval))
        count = 1
        while count < calc2:

            user32.keybd_event(0x12, 0, 0, 0) #Alt
            sleep(1)
            user32.keybd_event(0x09, 0, 0, 0) #Tab
            sleep(.1)
            user32.keybd_event(0x09, 0, 2, 0) #~Tab
            sleep(.1)
            user32.keybd_event(0x09, 0, 0, 0) #Tab
            sleep(.1)
            user32.keybd_event(0x09, 0, 2, 0) #~Tab
            sleep(.1)
            user32.keybd_event(0x12, 0, 2, 0) #~Alt
            sleep(interval)
            count = count + 1
        else:
            self.close() 

    def close(self):
        self.root.destroy()
        quit()

app = App()