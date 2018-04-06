1 rem name: snake
2 rem author: adam douglas
50 gosub 10000
60 rem calls the initialise high scores array function
70 gosub 13000
80 rem calls the initialise snake and levels array function
100 phrase$ = "welcome to snake"
105 for i = 0 to 3
108     gosub 1000
109 next i
110 for i = 1 to len(phrase$)
120     print tab(i+10) + mid$(phrase$, i, 1)
130 next i
135 for i = 0 to 3
140     gosub 1000
150 next i
160 print "press space to continue..."
170 get key$
180 if key$ <> " " then 170
185 rem prints the opening screen and prompts the user to continue
190 gosub 1100
200 gosub 1300
999 end
1000 rem FUNCTION: ------this function is used for printing a blank line------
1010 print ""
1020 return
1030 rem FUNCTION: ------this function is used for printing a - line------
1040 print "---------------------------------------"
1050 return
1100 rem FUNCTION: ----------this is the password function----------
1110 print chr$(147)
1112 gosub 1030
1115 print tab((40 - len("password"))/2);"password"
1118 gosub 1030;:gosub 1000
1120 for i = 3 to 1 step -1
1130     input "enter a password: "; pass$
1135     gosub 1000
1140     if pass$ <> "foo" then print "incorrect.";i-1;"tries remaining." 
1150     if pass$ = "foo" then i = 0
1155     gosub 1000
1160 next i
1165 rem counts down from 3 to 1 collecting the input for password
1168 rem if it is incorrect it prints the amount of tries
1169 rem if it is correct it ends the counted loop
1170 if pass$ <> "foo" then print "terminating program.";: goto 999
1175 gosub 1000
1180 print "correct! press space to continue..."
1185 poke 198,0: wait 198,1 
1190 get key$
1200 if key$ <> " " then 1190
1205 rem terminates or continues the program
1210 return
1300 rem FUNCTION: ----------this is the main menu function----------
1305 programCount = programCount + 1
1310 print chr$(147)
1320 gosub 1030
1330 print tab((40 - len("main menu"))/2);"main menu"
1340 gosub 1030;:gosub 1000
1350 print "1 - play game"
1360 print "2 - instructions"
1370 print "3 - high scores"
1380 print "4 - exit"
1385 choice = 0
1390 input choice
1395 if choice<>1 and choice<>2 and choice<>3 and choice<>4 then 1390
1400 if choice = 1 then gosub 2000:gosub 15000
1410 if choice = 2 then gosub 8000
1420 if choice = 3 then gosub 9000
1430 if choice = 4 then 1480
1440 if choice = 1 or choice = 2 or choice = 3 then 1460
1450 rem asks for and retrieves choice for the menu options
1460 input "run the program again? y/n "; loop$
1470 if loop$ = "y" then 1300
1475 gosub 1000
1480 print "thank you for playing snake. ";: return
1490 rem loops or ends the program based on user input
2000 rem FUNCTION: ----------this is the play game function----------
2010 print chr$(147)
2020 gosub 1030
2030 print tab((40 - len("game")) / 2);"game"
2040 gosub 1030;:gosub 1000
2050 print "what difficulty? (1, 2, 3, 4, 5)"
2060 input speed:gosub 14000
2065 if speed<>1 and speed<>2 and speed<>3 and speed<>4 and speed<>5 then 2050
2070 print "what level? (1, 2, 3, 4, 5)"
2075 input level:gosub 13500
2080 if level<>1 and level<>2 and level<>3 and level<>4 and level<>5 then 2070
2085 let firstTime = 1
2086 count = 0
2087 gosub 4500
2088 m$ = "D"
2090 gosub 7000: gosub 7500
2099 rem calls the delay function and listens for an input
2100 if snake(lngth) = food or firstTime = 1 then gosub 3000
2110 rem calls the placeFood function
2120 gosub 4000: gosub 7500
2130 rem calls the display function and listens for an input
2140 gosub 6000: gosub 7500
2150 rem calls the move snake function and listens for an input
2155 gosub 5000: gosub 7500
2158 rem calls the check function and listens for an input
2159 firstTime = 0
2160 if gameOver <> 1 then 2090
2170 rem it does this while the game is not over
2990 return
3000 rem FUNCTION: ----------this is the placeFood function----------
3010 xFood = int(rnd(1) * 40)
3020 yFood = int(rnd(1) * 25)
3030 food = 1024+xFood+40*yFood
3040 rem generates a random value for food and puts it in the poke formula
3990 return
4000 rem FUNCTION: ----------this is the display function----------
4010 poke snake(lngth),162
4015 poke space,32
4020 if peek(food) = 162 or peek(food) = 118 then gosub 3000
4030 poke food,42
4490 return
4500 rem FUNCTION: ----------this is the first display function----------
4510 print chr$(147)
4520 rem clears the screen
4530 for i = 0 to lngth
4540     poke snake(i),162
4550 next
4560 rem prints the snake
4570 if peek(food) = 162 or peek(food) = 118 then gosub 3000
4580 rem checks if food is on the snake or barrier to recall the function
4590 poke food,42
4600 rem prints the food once in a good location
4610 for i = 0 to cells
4620     poke level(i),118
4630 next
4640 rem prints the level
4990 return
5000 rem FUNCTION: ----------this is the check function----------
5010 if snake(lngth) = food then lngth=lngth+1:count=count+1:delay=delay-1
5012 rem if the newest snake cell is on food then the length and score increase
5015 if snake(lngth) < 1024 or snake(lngth) > 2023 then gameOver = 1
5018 rem if the snake goes abover or below the screen the game is over 
5020 if peek(snake(lngth)) = 118 or peek(snake(lngth)) = 162 then gameOver = 1
5030 rem if the snake is on a barrier or itself then the game is over
5990 return
6000 rem FUNCTION: ----------this is the move snake function----------
6010 if m$ = "W" then snake(lngth+1)=snake(lngth) - 40
6020 if m$ = "A" then snake(lngth+1)=snake(lngth) - 1
6030 if m$ = "S" then snake(lngth+1)=snake(lngth) + 40
6040 if m$ = "D" then snake(lngth+1)=snake(lngth) + 1
6042 rem gives meaningful numbers to the key input for snake location
6044 space = snake(0)
6045 for i = 0 to lngth
6046     snake(i) = snake(i+1)
6047 next
6048 rem shifts every index down by one
6050 return
7000 rem FUNCTION: ----------this is the delay function----------
7005 if delay = -1 then 7030
7010 for i = 0 to delay
7020 next i 
7025 rem empty loop causes a delay which can be modified in time
7030 return
7500 rem FUNCTION: ----------this is the listen/keypress function----------
7510 keypress = peek(197)
7520 if keypress = 9 then m$ = "W"
7525 if keypress = 18 then m$ = "D"
7530 if keypress = 13 then m$ = "S"
7535 if keypress = 10 then m$ = "A"
7538 rem assigns the temporary keypress data to a variable, checks it for WASD
7540 return
8000 rem FUNCTION: ----------this is the instructions function----------
8010 print chr$(147)
8020 gosub 1030
8030 print tab((40 - len("instructions")) / 2);"instructions"
8040 gosub 1030;: gosub 1000
8050 print "using the w-a-s-d keys, move your snake"
8060 print "around the screen and collect the food."
8070 print "the food will give you points, but it"
8080 print "will also increase the speed and size"
8090 print "of the snake. while collecting food,"
8100 print "you cannot touch yourself, the border,"
8110 print "or the walls featured in different"
8120 print "levels, or the game will be over."
8130 print "good luck!"
8140 gosub 1000
8150 rem prints instructions on how to play the game.
8990 return
9000 rem FUNCTION: ----------this is the high scores function---------- 
9010 print chr$(147)
9020 gosub 1030
9030 print tab((40 - len("high scores")) / 2);"high scores"
9040 gosub 1030;:gosub 1000
9050 gosub 11000 
9060 rem calls the function for sorting high scores
9070 gosub 12000
9080 rem calls the function for printing high scores
9990 return
10000 rem FUNCTION: -----this is the initialise high score array function-----
10010 dim name$(99)
10020 dim num(99)
10030 for a = 0 to 99
10040     name$(a) = "X"
10050     num(a) = 0
10060 for a = 0 to 4
10070     read name$(a)
10078 next
10080 for a = 0 to 4
10090     read num(a)
10105 next
10110 data "ajd", "nrp", "jlw", "hjw", "sjr"
10120 data 50,40,30,20,10
10125 programCount = 0
10130 return
11000 rem FUNCTION: -----this is the bubble sort high score array function-----
11010 swapped = 0
11020 for i = 1 to 98
11030     if num(i) < num(i + 1) then gosub 11500
11040 next
11050 if swapped = 1 then 11010
11060 return
11500 rem FUNCTION: --------this is swap function for the bubble sort--------
11505 temp = num(i)
11510 num(i) = num(i + 1)
11520 num(i + 1) = temp
11530 temp$ = name$(i)
11540 name$(i) = name$(i + 1)
11550 name$(i + 1) = temp$
11560 swapped = 1
11565 rem Swaps the numbers and names in the two tested indexes
11570 return
12000 print "    name  score"
12005 for i = 0 to 4 step 1
12010     print str$(i+1) + ". " + name$(i) + "  " + str$(num(i))
12020 next
12025 gosub 1000
12028 rem Prints the top 5 high scores in a table format
12030 return
13000 rem FUNCTION: ----------this is the initialise snake function----------
13010 dim snake(999) 
13015 read snake(0),snake(1),snake(2)
13018 lngth = 2
13025 print rnd(0)
13028 rem puts the random function at a different place in the set list
13029 data 1718, 1719, 1720
13030 return
13500 rem FUNCTION: ----------this reads in the level design----------
13630 return
14000 rem FUNCTION: ----------this is the difficulty function----------
14010 if speed = 1 then delay = 100
14020 if speed = 2 then delay = 80
14030 if speed = 3 then delay = 60
14040 if speed = 4 then delay = 40
14050 if speed = 5 then delay = 0
14990 return
15000 rem FUNCTION: ----------this is the game over function----------
15010 gosub 9000
15020 gosub 1000
15030 print "game over. your score: " + str$(count)
15035 num(programCount+4) = count
15040 input "enter your initials: ";name$(programCount+4)
15050 gosub 9000