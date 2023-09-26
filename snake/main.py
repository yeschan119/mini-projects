from turtle import Screen, Turtle
from snake import Snake
from food import Food
from scoreboard import Scoreboard
import time
#name game

#make 2 steps
# first step
## make a snake
## move a snake
## control the snake

# second step
## detect collision with food
## create a scoreboard
## detect collision with wall
## detect collision with tail

screen = Screen() #display the screen
screen.setup(width=600, height=600)
screen.bgcolor("black")
screen.title("My Snake Game")

#step 1 create a snake
screen.tracer(20)
snake = Snake()
food = Food()
score = Scoreboard()

#wait for the command from keyboard
screen.listen()

#control the snake with keyboard
screen.onkey(snake.up, "Up")
screen.onkey(snake.down, "Down")
screen.onkey(snake.left, "Left")
screen.onkey(snake.right, "Right")

#step 2 move a snake
game_is_on = True
while game_is_on:
    screen.update()
    time.sleep(0.1)
    snake.move()
    
    #detect collision with food
    if snake.head.distance(food) < 14:
        food.refresh()
        snake.extend()
        score.increase_score()
        
    #detect collision with wall
    #xcor(), ycor()는 해당 turtle객체가 있는 좌표를 리턴
    if snake.head.xcor() > 290 or snake.head.xcor() < -290 or snake.head.ycor() > 290 or snake.head.ycor() < -290:
        game_is_on = False
        score.game_over()
    
    #detect collision with tail
    #if head collides with any segment in the tail, trigger game_over
    for segment in snake.snake_body[1:]:
        if snake.head.distance(segment) < 10:
            game_is_on = False
            score.game_over()
    

#not to disappear the screen
screen.exitonclick()