from tkinter import *
from tkinter import ttk

#Create an instance of Tkinter frame
win = Tk()

#Set the geometry of Tkinter frame
win.geometry("450x600")

def display_text(event=None):
   global finalcalc
   userinput1 = entry1.get()
   userinput2 = entry2.get()
   userinput3 = entry3.get()
   userinput4 = entry4.get()
   userinput5 = entry5.get()

   if userinput1 == "":
      userinput1 = 1
   else:
      userinput1 = float(entry1.get())

   if userinput2 == "":
      userinput2 = 1
   else:
      userinput2 = float(entry2.get())

   if userinput3 == "":
      userinput3 = .0000000001
   else:
      userinput3 = float(entry3.get())

   if userinput4 == "":
      userinput4 = 0
   else:
      userinput4 = float(entry4.get())

   if userinput5 == "":
      userinput5 = 0
   else:
      userinput5 = float(entry5.get())   
   
   userinput1 = userinput1 - userinput5
   calc1 = userinput3 / 100
   calc2 = calc1 / 12
   calc3 = userinput4 / 12
   finalcalc = calc3 + (userinput1 * ((calc2 * ((1 + calc2) ** userinput2)) / (((1 + calc2) ** userinput2) - 1)))
   finalcalc = round(finalcalc, 2)
   finalcalc = str(finalcalc)
   label4.configure(text=("Payment per Period  $" + finalcalc))
   # win.quit()

#Initialize a Label to display the User Input
label1 = Label(win, text="Loan Calculator", font=("Courier 22 bold"))
label1.pack(pady=10)

#Initialize a Label to display the User Input
label2 = Label(win, text="Loan Amount", font=("Courier 12 bold"))
label2.pack()

#Create an Entry widget to accept User Input
entry1 = Entry(win, width=30)
entry1.focus_set()
entry1.pack()

#Initialize a Label to display the User Input
label7 = Label(win, text="Down Payment", font=("Courier 12 bold"))
label7.pack()

#Create an Entry widget to accept User Input
entry5 = Entry(win, width=30)
entry5.pack()

#Initialize a Label to display the User Input
label3 = Label(win, text="Loan Length in Months", font=("Courier 12 bold"))
label3.pack()

#Create an Entry widget to accept User Input
entry2 = Entry(win, width=30)
entry2.pack()

#Initialize a Label to display the User Input
label5 = Label(win, text="Interest", font=("Courier 12 bold"))
label5.pack()

#Create an Entry widget to accept User Input
entry3 = Entry(win, width=30)
entry3.pack()

#Initialize a Label to display the User Input
label6 = Label(win, text="Yearly Taxes and Fees", font=("Courier 12 bold"))
label6.pack()

#Create an Entry widget to accept User Input
entry4 = Entry(win, width=30)
entry4.pack()

#Initialize a Label to display the User Input
finalcalc = "Answer Here"
label4 = Label(win, text=finalcalc, font=("Courier 12 bold"))
label4.pack(pady=10)

win.bind("<Return>", display_text)

#Create a Button to validate Entry Widget
ttk.Button(win, text="Calculate", width=20, command=display_text).pack()
ttk.Button(win, text="Close", command=quit).pack()
# ttk.Checkbutton(win, text="Hello").pack()

win.mainloop()