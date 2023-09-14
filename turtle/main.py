from turtle import Turtle, Screen
import tkinter as tk

timmy_the_turtle = Turtle()
timmy_the_turtle.shape("turtle")
timmy_the_turtle.color("red")

#draw dashed line
for _ in range(15):
    timmy_the_turtle.forward(10)
    timmy_the_turtle.penup()
    timmy_the_turtle.forward(10)
    timmy_the_turtle.pendown()
    
    #timmy_the_turtle.left(90)

screen = Screen()
screen.exitonclick()