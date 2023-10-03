from turtle import Turtle, Screen

class Paddle(Turtle):
    def __init__(self, x, y):
        #turtle class를 상속 받아서 초기화 시켜주는 작업
        super(). __init__()
        self.shape("square")
        self.color("white")
        # 100 x 20 사이즈의 패들 생성. 기본이 20 x 20이므로 비율을 아래와 같이 하면 됨
        self.shapesize(stretch_wid=5, stretch_len=1)
        self.penup()
        self.goto(x, y)
        
    def go_up(self):
        new_y = self.ycor() + 20
        self.goto(self.xcor(), new_y)
    
    def go_down(self):
        new_y = self.ycor() - 20
        self.goto(self.xcor(), new_y)