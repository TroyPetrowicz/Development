
from env import credintials as unandpw
import tkinter
from tkinter import *


class Signin:
    def __init__(self):
        global unandpw
        global username
        global password
        global messagebox
        
        self.root = tkinter.Tk()
        self.root.geometry("300x200")
        
        #Initialize a Label to display the User Input
        labeluser = Label(self.root, text="Username", font=("Courier 12 bold"))
        labeluser.pack()
        
        #Create an Entry widget to accept User Input
        username = Entry(self.root, width=30)
        username.focus_set()
        username.pack()
        
        #Initialize a Label to display the User Input
        labelpass = Label(self.root, text="Password", font=("Courier 12 bold"))
        labelpass.pack()
        
        #Create an Entry widget to accept User Input
        password = Entry(self.root, width=30)
        password.pack()
        
        #Initialize a Label to display the User Input
        messagebox = Label(self.root, text="", font=("Courier 12 bold"), pady=10)
        messagebox.pack()
        
        self.root.bind("<Return>", self.login)
        
        self.root.mainloop()
        

    def check(self, event=None):
        global unandpw
        global username
        global password
        global messagebox
        if username1 in unandpw: 
            for user, passw in unandpw.items():
                if passw == password1:
                    messagebox.configure(text=("Welcome"))
                    self.close()
                    return
            else:
                messagebox.configure(text=("Password is Incorrect, Please Try Again"))
                self.wrongpw()
        else: 
            messagebox.configure(text=("This username does not exist"))
            self.login()
            
    def login(self, event=None):
        global username
        global password
        global password1
        global username1
        
        username1 = str(username.get())
        password1 = str(password.get())
        
        if username1 == "":
            username1 = "Username"
        if password == "":
            password1 = "Password"

        self.check()

    def wrongpw(self, event=None):
        global password1
        global password
        password1 = str(password.get())
        self.check()
        
        
    def close(self):
        self.root.destroy()
        
        
signin = Signin()
signin.login()


