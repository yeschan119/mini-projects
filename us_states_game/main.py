import turtle
import pandas
from show_states import ShowState
import json

NUM_OF_STATES = 50
screen = turtle.Screen()
screen.title("U.S stats game")
image = "blank_states_img.gif"
screen.addshape(image)

turtle.shape(image)

states_info = pandas.read_csv("50_states.csv")
state_list = states_info.state.to_list()

with open('border_line.json', 'r') as json_file:
    border_info = json.load(json_file)

show_states = ShowState()
right_answer_cnt = 0
guessed_state_list = []
remained_states = []

while True:
    bar_title = str(right_answer_cnt) + "/50 States Correct"
    input_state = screen.textinput(title=bar_title, prompt="What's another state's name?")
    
    if input_state == None or right_answer_cnt >= NUM_OF_STATES:
        remained_states = list(set(state_list) - set(guessed_state_list))
        break
    #title()은 첫 글자를 대문자로 나머지는 모두 소문자로 바꿔줌
    if input_state.title() in state_list:
        right_answer_cnt += 1
        guessed_state = states_info[states_info.state == input_state.title()]
        show_states.write_state_name(state_name=input_state.title(),
                                    posx=int(guessed_state.x), posy=int(guessed_state.y))
        
        show_states.paint_state(border_info[input_state.title()])
        guessed_state_list.append(input_state)
        
remained_data = pandas.DataFrame(remained_states)
remained_data.to_csv("remained_states.csv")

turtle.mainloop()