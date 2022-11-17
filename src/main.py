import datetime
CURRENT_TIME = datetime.datetime.now()
x=CURRENT_TIME.strftime("%d-%m-%Y %H:%M:%S")
print("Current date and time : ", x)
