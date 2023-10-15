from turtle import Turtle

class ShowState(Turtle):
    def __init__(self):
        super().__init__()
        self.hideturtle()
        
    def write_state_name(self, state_name, posx, posy):
        self.penup()
        self.goto(posx, posy)
        self.write(state_name)
        
    def paint_state(self, border_list):
        self.goto(border_list[0][0], border_list[0][1])
        self.pendown()
        self.fillcolor("yellow")
        self.begin_fill()
        for pos in border_list:
            self.goto(pos[0], pos[1])
        self.end_fill()