import pyautogui
import time

message = "I Love U"
n = 10

time.sleep(2.5)

for i in range(n):
	pyautogui.typewrite(message+ "\n")