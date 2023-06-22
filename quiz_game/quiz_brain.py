class QuizBrain:
    def __init__(self, q_list):
        self.question_number = 0
        self.question_list = q_list
        self.question_cnt = len(q_list)
        
    def has_still_question(self):
        if self.question_number < self.question_cnt:
            return True
        else:
            return False
        
    def next_question(self):
        current_question = self.question_list[self.question_number]
        self.question_number += 1
        current_answer = input(f"Q.{self.question_number}: {current_question.text} (True/False)? ")
        if current_answer == current_question.answer:
            print('Great!')
        else:
            print("Stupid")