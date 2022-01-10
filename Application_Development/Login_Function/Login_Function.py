class Signin:
    def __init__(self):
        global unandpw
        unandpw = {"troyp": "5106510", "leandrap": "123456", "vincentp": "321654"}

    def check(self):
        global unandpw
        if username1 in unandpw: 
            for username, password in unandpw.items():
                if password == password1:
                    print("Welcome")
                    return
            else:
                print("Password is Incorrect, Please Try Again")
                self.wrongpw()
        else: 
            print("This username does not exist")
            self.login()
            
    def login(self):
        global password1
        global username1
        username1 = input("Input Your Username: ")
        password1 = str(input("Input Your Password: "))
        self.check()

    def wrongpw(self):
        global password1
        password1 = str(input("Input Your Password: "))
        self.check()
        
signin = Signin()
signin.login()


