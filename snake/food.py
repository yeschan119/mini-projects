from turtle import Turtle
import random

#뱀의 먹이를 재현하는 API
#뱀의 머리가 먹이와 부딪힐 때 먹는 것으로 보고 하나가 먹히면 랜덤으로 임의의 장소에 먹이가 생성
class Food(Turtle):
    
    def __init__(self):
        super().__init__()
        self.shape("turtle")
        self.penup()
        self.shapesize(stretch_len=0.5, stretch_wid=0.5) #shapesize는 default가 20  x 20인데 10  x 10으로 하고 싶다는 것
        self.color("blue")
        self.speed("fastest")
        self.refresh()
        
    def refresh(self):
        random_x = random.randint(-270, 270)
        random_y = random.randint(-270, 270)
        self.goto(random_x, random_y)