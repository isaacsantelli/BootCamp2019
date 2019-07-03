import sys
import box
import itertools
import time
import random

'''
Structure of the game
When the game starts
(1) Check the number of arguments
(2) Initialize Timer
(3) Initialize Number List
(4) Move Step
(5) Win Conditions
'''

if __name__ == "__main__":
    if len(sys.argv) == 3:
        finish = time.time() + float(sys.argv[2])
        numlist = list(range(1,10))
        while time.time() < finish:
            roll = random.randint(1,6)
            if sum(numlist) > 6:
                roll += random.randint(1,6)
            if not box.isvalid(roll, numlist):
                print("Game Over Loser")
                break
            print("Numbers Left: ", numlist)
            print("Roll: ", roll)
            while time.time() < finish:
                print("Seconds Left:", round(finish - time.time()) )
                inp = input("Numbers to Eliminate: ")
                inp = box.parse_input(inp, numlist)
                if (len(inp) > 0):
                    break
                else:
                    print("Invalid Input")
            for num in inp:
                numlist.remove(num)
            if len(numlist) == 0:
                print("Score for player", sys.argv[1], "0 points")
                print("Time played:", round(finish - time.time()))
                print("Congratulations!! You shut the box!")
                quit()
        if len(numlist) > 0:
            print("Sorry buddy ya snooze ya looze time ran out and you lost")
            print("Also this is like golf so points are bad :(")
            print("You now have", sum(numlist), points)
    else:
        print("Wrong Number of Arguments")
        quit()
