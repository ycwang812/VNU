import urllib.request
import time
import facebook
from tkinter import *
from threading import Thread

class Starbuzz(Frame):

    def __init__(self, master=None):
        self.access_token = "CAAFf8rLlvz0BABYEPW9Soa4QkAjZC9ua49JBdrKiIHvZCDrnC0BrhDitYAMhnzRjEOmxUrtc8P07NO3n0lEFP7iV5ooZCKZCMpM4t6gzWC64qIcUcqybZAtmHuyoZAs4k2lHcRCJQgNuw2oAXCnrZBJMI4219NnNg8NAzFUcIKjcwNZCMBdR0XnzOW5GxY6AsXQJZCxp80mtYkHc48aaejq05rupiaVasC8vuJm5EMZBZB0vgZDZD"
        self.buy_price = 5.1
        self.is_run = False
        Frame.__init__(self, master)
        self.grid()
        self.createWidgets()

    def createWidgets(self):
        self.buyPriceText = Label(self)
        self.buyPriceText["text"] = "目標價格:"
        self.buyPriceText.grid(row=0, column=0)
        
        self.buyPriceField = Entry(self)
        self.buyPriceField.grid(row=0, column=1)
        self.buyPriceField.insert(0, self.buy_price)

        self.save = Button(self)
        self.save["text"] = "儲存"
        self.save.grid(row=0, column=2)
        self.save["command"] =  self.save_buy_price
        
        self.logText = Text(self)
        self.logText.grid(row=1, columnspan=3)
        
        self.startQuery = Button(self)
        self.startQuery["text"] = "開始查價"
        self.startQuery.grid(row=2, column=0)
        self.startQuery["command"] =  self.start_query
        
        self.stopQuery = Button(self)
        self.stopQuery["text"] = "停止查價"
        self.stopQuery.grid(row=2, column=2)
        self.stopQuery["command"] =  self.stop_query

    def save_buy_price(self):
        self.buy_price = float(self.buyPriceField.get())
        self.logText.insert(END, "目標價格改為 " + str(self.buy_price))
        self.logText.insert(END, "\n")

    def get_facebook_api(self):
        graph = facebook.GraphAPI(self.access_token)
        return graph

    def send_to_facebook(self, msg):
        api = self.get_facebook_api()
        status = api.put_wall_post(msg)
        self.logText.insert(END, "facebook.GraphAPI: " + str(status))
        self.logText.insert(END, "\n")

    def get_price(self):
        page = urllib.request.urlopen("http://beans-r-us.appspot.com/prices.html")
        text = page.read().decode("utf8")

        where = text.find(">$")

        start_of_price = where + 2
        end_of_price = start_of_price + 4

        return float(text[start_of_price:end_of_price])

    def query_price(self):
        price = 99.99
	
        while price > self.buy_price:
            if not self.is_run:
                break
        
            time.sleep(5)
        
            price = self.get_price()
            self.logText.insert(END, "目前價格為: " + str(price))
            self.logText.insert(END, "\n")

        if self.is_run:
            self.logText.insert(END, "目前價格 " + str(price) + " 低於目標價格 " + str(self.buy_price) + "! Buy!")
            self.logText.insert(END, "\n")
            self.send_to_facebook("目前價格 " + str(price) + " 低於目標價格 " + str(self.buy_price) + "! Buy!")

    def start_query(self):
        self.is_run = True
        self.logText.insert(END, "開始查價...")
        self.logText.insert(END, "\n")
        Thread(target=self.query_price).start()

    def stop_query(self):
        self.is_run = False
        self.logText.insert(END, "停止查價...")
        self.logText.insert(END, "\n")

if __name__ == '__main__':
    root = Tk()
    root.title("Starbuzz")
    app = Starbuzz(master=root)
    app.mainloop()
