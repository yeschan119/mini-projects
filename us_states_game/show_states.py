from turtle import Turtle

class ShowState(Turtle):
    def __init__(self):
        super().__init__()
        self.hideturtle()
        self.penup()
        
    def write_state_name(self, state_name, posx, posy):
        self.goto(posx, posy)
        self.write(state_name)