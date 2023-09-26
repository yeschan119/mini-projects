from turtle import Screen, Turtle

#뱀의 몸을 만들어 주는 API
STARTING_POSITION = [(0, 0), (-20, 0), (-40, 0)]
UP = 90
DOWN = 270
LEFT = 180
RIGHT = 0

MOVE_DISTANCE = 20

class Snake:
    def __init__(self):
        self.snake_body = []
        self.create_snake()
        self.head = self.snake_body[0]
    
    #starting position에 세 개의 점을 찍고 세점을 연결하여 뱀을 생성
    #snake_body리스트가 곧 뱀의 몸체임
    def create_snake(self):
        for pos in STARTING_POSITION:
            self.add_segment(pos)
    
    def add_segment(self, position):
        segment = Turtle(shape="square")
        segment.shapesize(0.8, 0.8)
        segment.color("white")
        segment.penup()  #penup() 메서드는 0, 0에서 이동할 때 이동경로에 따라 그어지는 선을 없앨 때 사용
        segment.goto(position) #goto()는 주어진 좌표로 이동
        self.snake_body.append(segment)
        
    def extend(self):
        #add a new segment to the snake
        self.add_segment(self.snake_body[-1].position())
        
    #전체적으로 움직이는 방법은 다음과 같다.
    #3번이 2번 자리로, 2번이 1번 자리로, 1번은 원하는 자리로
    #이런식으로 움직여야 1번을 머리로 하여, 머리가 움직이는 방향으로 몸이 따라옴
    def move(self):
        for seg_num in range(len(self.snake_body)-1, 0, -1):
            new_x = self.snake_body[seg_num-1].xcor()
            new_y = self.snake_body[seg_num-1].ycor()
            self.snake_body[seg_num].goto(new_x, new_y)
        self.head.forward(MOVE_DISTANCE)
    
    #방향 메서드들은 키보드에 반응하기 위한 것
    def up(self):
        if self.head.heading() != DOWN:
            self.head.setheading(UP)
        
    def down(self):
        if self.head.heading() != UP:
            self.head.setheading(DOWN)
    
    def left(self):
        if self.head.heading() != RIGHT:
            self.head.setheading(LEFT)
    
    def right(self):
        if self.head.heading() != LEFT:
            self.head.setheading(RIGHT)