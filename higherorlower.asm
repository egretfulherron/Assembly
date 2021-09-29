//Code
      LDR R1, max // assigns max 13 to reg to be used after
      LDR R2, min // same but for min 0

      //get input from the user and check first input against min and max to check they’re valid
      INP R3, 2 // get user input (a)
      CMP R3, R1 // compares (a) to max 13
      BGT toobig // branches to a type of error message, which will also stop the program, if (a) bigger than the max allowed (invalid)
      CMP R3, R2 // compares a) to min 0
      BLT toosmol // the same as above for toobig, but for it being smaller instead of bigger

      //Get and check second input
      INP R4, 2 // get user input (b), repeat as above with (b) instead of (a)
      CMP R4, R1 
      BGT toobig 
      CMP R4, R2 
      BLT toosmol 

      //Load up card themed ascii char from the array (A 2-10, J, Q, K)
      MOV R11, #cardLabel // cardLabel is the starting point of the card array (1 of 2)
      MOV R12, #cardLabel // (2 of 2)
      ADD R11, R11, R3 // uses the value of a) stored in R3, to count to the right card char, and save it in R11 (1/2)
      ADD R12, R12, R4 // uses the value of b) stored in R4, to count to the right card char, and save it in R12(2/2)

      //Begin to print the answer to comparison calculation
      OUT R12, 8 // prints out card char for value (b), which we stored above in R12
      CMP R4, R3 // two input face-off 
      BGT greater // branches to the outcome, b) is bigger than a)
      BLT lower // same as greater but b) is smaller than a)
      BEQ equal//same but a) and b) are equal 
      HALT //ends


//DATA
min:
      DAT 0x00// min value of the card, A
max:
      DAT 0x0D// max value of card, K
// all of the methods and strings are paired up to make it easier to read
// for all of the methods (:) from here,
 // they tell the system, on a high level,
 //which message to print, and then to stop 


toobig:
      MOV R5, #stringtoobig 
      OUT R5, 8 //prints a string saying the number is too big
      HALT
stringtoobig: // for all of the strings in 
      //this section, they print into latin characters, 
      //explaining the issue with the input, or the result of the higher or lower game
      DAT 0x61656c50
      DAT 0x74206573
      DAT 0x61207972
      DAT 0x616d7320
      DAT 0x72656c6c
      DAT 0x6d756e20
      DAT 0x21726562
      DAT 0x00


toosmol: MOV R6, #stringtoosmol 
      OUT R6, 8
      HALT
      stringtoosmol: // prints a request for a larger number
      DAT 0x61656c50
      DAT 0x74206573
      DAT 0x61207972
      DAT 0x67696220
      DAT 0x20726567
      DAT 0x626d756e
      DAT 0x217265
      DAT 0x00
      //comparing the two input answers


lower: 
      MOV R7, #stringlower //the branch when b) is smaller than a)
      OUT R7, 8 //print the string saying so
      OUT R11, 8 //print a)
      HALT // end program
stringlower:
      DAT 0x20736920 // the string mentioned above 
      DAT 0x6c616d73
      DAT 0x2072656c
      DAT 0x6e616874
      DAT 0x0a0d20
      DAT 0x00


greater: // this is the exact same as lower, but instead for bigger
      MOV R7, #stringgreater
      OUT R7, 8
      OUT R11, 8
      HALT
stringgreater: //same as stringlower, but for greater
      DAT 0x20736920
      DAT 0x67676962
      DAT 0x74207265
      DAT 0x206e6168
      DAT 0x0d0a
 DAT 0x00


equal: // same again, but for ‘the same as’
      MOV R7, #stringequal
      OUT R7, 8
      OUT R11, 8
      HALT
stringequal: // this is probably self explanatory now
      DAT 0x20736920
      DAT 0x61757165
      DAT 0x6f74206c
      DAT 0x20
      DAT 0x00 


cardLabel: DAT 0x01 // the beginning of the card array
      DAT 0x41 // A
      DAT 0x32 
      DAT 0x33 
      DAT 0x34 
      DAT 0x35 
      DAT 0x36 
      DAT 0x37 
      DAT 0x38 
      DAT 0x39 
      DAT 0x3031 // 10
      DAT 0x4A // J 11
      DAT 0x51 // Q 12
      DAT 0x4B // K 13



