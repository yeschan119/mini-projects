import turtle
import pandas
from show_states import ShowState

screen = turtle.Screen()
screen.title("U.S stats game")
image = "blank_states_img.gif"
screen.addshape(image)

turtle.shape(image)

'''
#화면에 마우스를 클릭하면 좌표를 리턴해주는 함수
def get_mouse_click_coor(x, y):
    print(x, y)

turtle.onscreenclick(get_mouse_click_coor)
'''
states_info = pandas.read_csv("50_states.csv")
show_states = ShowState()
answer_cnt = 0

while True:
    bar_title = str(answer_cnt) + "/50 States Correct"
    input_state = screen.textinput(title=bar_title, prompt="What's another state's name?")
    
    if input_state == None:
        break
    for state, x, y in zip(states_info.state, states_info.x, states_info.y):
        #title()은 첫 글자를 대문자로 나머지는 모두 소문자로 바꿔줌
        if state.title() == input_state.title():
            answer_cnt += 1
            show_states.write_state_name(state_name=input_state.title(), posx=x, posy=y)
    
turtle.mainloop()