from turtle import Turtle, Screen
from paddle import Paddle
from ball import Ball
from scoreboard import Scoreboard
import time

#Break the problem
##Create the screen
##create and move a paddle
##create another paddle
##create the ball and make it move
##detect collision with all and bounce
##detect when paddle misses
##keep score

## create the screen
screen = Screen()
screen.bgcolor("black")
screen.setup(width=800, height=600)
screen.title("Pong")
#tracer를 끄지 않으면 paddle은 (0,0)에서 만들어져 원하는 위치로 이동하는 모습이 보인다.
#이를 꺼야 화면을 켰을 때 원하는 위치로 옮겨지는 모습이 안보임
screen.tracer(0)

## create and move a paddle
r_paddle = Paddle(350, 0)
l_paddle = Paddle(-350, 0)

ball = Ball()
scoreboard = Scoreboard()

screen.listen()
screen.onkey(r_paddle.go_up, "Up")
screen.onkey(r_paddle.go_down, "Down")
screen.onkey(l_paddle.go_up, "w")
screen.onkey(l_paddle.go_down, "s")
#tracer를 껐기 때문에 매번 screen을 직접 update을 해주지 않으면 화면에 아무 것도 나타나지 않음
game_is_on = True

#화면을 갱신해줌
while game_is_on:
    time.sleep(ball.move_speed)
    screen.update()
    ball.move()
    #detect collision with wall
    if ball.ycor() > 280 or ball.ycor() < -280:
        ball.bounce_y()

    #detect collision with paddle
    if ball.distance(r_paddle) < 50 and ball.xcor() > 320 or ball.distance(l_paddle) < 50 and ball.xcor() < -320:
        ball.bounce_x()
        
    #r_paddle misses the ball
    if ball.xcor() > 380:
        ball.reset_position()
        scoreboard.l_point()
    
    #l_paddle misses the ball
    if ball.xcor() < -380:
        ball.reset_position()
        scoreboard.r_point()

screen.exitonclick()