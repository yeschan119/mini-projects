from turtle import Turtle

#뱀이 먹이를 먹을 때마다 점수가 올라가도록 하는 API
ALINEMENT = "center"
FONT = ("Arial", 22, "normal")

class Scoreboard(Turtle):
    def __init__(self):
        super().__init__()
        self.score = 0
        self.color("white")
        self.penup()
        self.goto(0, 270)
        self.hideturtle()   #hideturtle()을 해주면  turtle객체를 가져다 쓰면서 turtle이 화면이 안보이게 함
        self.update_scoreboard()
    
    def update_scoreboard(self):
        self.write(f"Score: {self.score}", align=ALINEMENT, font=FONT) 
    def increase_score(self):
        self.score += 1
        self.clear()  #점수가 바뀔때마다 clear해주지 않으면 덮어써지는 게 보임
        self.update_scoreboard()
        
    def game_over(self):
        self.goto(0,0)
        self.write("GAME OVER", align=ALINEMENT, font=FONT)