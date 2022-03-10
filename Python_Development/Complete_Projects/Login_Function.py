
from env import credintials as unandpw
import tkinter
from tkinter import *


class Signin:
    def __init__(self):
        global unandpw
        global userin
        global passin
        global messagebox
        
        self.root = tkinter.Tk()
        self.root.geometry("500x200")
        
        #Initialize a Label to display the User Input
        labeluser = Label(self.root, text="Username", font=("Courier 12 bold"))
        labeluser.pack()
        
        #Create an Entry widget to accept User Input
        userin = Entry(self.root, width=30)
        userin.focus_set()
        userin.pack()
        
        #Initialize a Label to display the User Input
        labelpass = Label(self.root, text="Password", font=("Courier 12 bold"))
        labelpass.pack()
        
        #Create an Entry widget to accept User Input
        passin = Entry(self.root, width=30)
        passin.pack()
        
        #Initialize a Label to display the User Input
        messagebox = Label(self.root, text="", font=("Courier 12 bold"), pady=10)
        messagebox.pack()
        
        tkinter.Button(self.root, text = 'Run', command=self.login).pack()
        
        self.root.bind("<Return>", self.login)
        
        self.root.mainloop()

    def check(self, event=None):
        global unandpw
        global userin
        global passin
        global messagebox
        if username1 in unandpw: 
            for user, passw in unandpw.items():
                if passw == password1:
                    messagebox.configure(text=("Welcome"))
                    self.close()
            else:
                messagebox.configure(text=("Password is Incorrect, Please Try Again"))
                #self.wrongpw()
        else: 
            messagebox.configure(text=("This username does not exist"))
            #self.login()
            
    def login(self, event=None):
        global userin
        global passin
        global password1
        global username1
        
        username1 = userin.get()
        password1 = passin.get()
        password1 = str(password1)
        username1 = str(username1)
        
        if username1 == "":
            username1 = "Username"
        if passin == "":
            password1 = "Password"

        self.check()

    def wrongpw(self, event=None):
        global password1
        global passin
        password1 = str(passin.get())
        self.check()
        
        
    def close(self):
        self.root.destroy()
        return
        #quit()
        
signin = Signin()
signin.login()


