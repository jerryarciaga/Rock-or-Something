Notes taken from the bash scripting class held by Brian from Null Space Labs. I may have been spending too much time *ricing* my Linux system so I might as well do something productive with it.

# What is a bash script?
Any text file with an x bit set. It also needs to end with `.sh` or start with a bash code.

# Setup for the class
```
mkdir ~/class
export PATH="~/class:.:$PATH"
echo $PATH
cd ~/class
```
## Explanation
We make a directory called `~/class`, then we set that directory, as well as the current directory to the `PATH` variable. Then we `echo $PATH` to show it.
# First script
Behold, the time-honored tradition of printing "Hello World" as everyone's first script. Now enter the following:
* `touch 1st.sh`
* `chmod +x 1st.sh`
* `vim 1st.sh`
Then add this to `1st.sh`
```
echo Hello World!
```
# Second script - using commandline arguments
Enter the same 3 commands like before but for `2nd.sh`.
Then enter the following:
```
echo Hello $1
```
This can be useful for applying the same set of commands for different arguments. After all, scripts are for saving time. 
# Third script - using `if` statements
Same drill, no make your 3rd script.
```
clear
if [ "$1" = 99 ]; then
    echo Hello agent 99
    exit
fi
echo Hello World!
exit
```
## Explanation
This script takes an argument, and depending on that argument it will print one of two possible outputs. If the argument (`$1`) is `99`, then it prints out `Hello agent 99`. Otherwise, it will just output `Hello world`.
# Fourth script - now we're counting arguments
Speedrun this. Enter `touch 4th && chmod +x 4th && vim 4th`
Add the following:
```
#!/usr/bin/env bash
clear

if [ "$#" -gt 3 ]; then 
    echo You only want 3 arguments.
    exit
fi

if [ "$#" -lt 3 ]; then 
    echo You need 3 arguments.
    exit
fi

echo You set 3 arguments.
exit
```
## Explanation
The number of arguments is stored in the variable `$#`. Here the switches `-gt` and `-lt` are being used. The expression `[ "$#" -gt 3]` looks at the number of arguments `$#` then checks if it's greater than 3. If that is correct, it returns `True` or `0`.
# Challenge
Here is where we combine what we learned to make a set of scripts with a single goal. To type the lost numbers and get a reply!
Okay, you did not watch Lost. It ran from 2004 to 2010 and no one liked the ending.
That being said we will make it so we can type the Lost numbers 4 8 15 16 23 42 in our terminal.
## Solution
Create a script with this inside.
```
#!/usr/bin/env bash
#This file expects you to type the Lost numbers "4 8 15 16 23 42"
clear

if [ "$#" -gt 5 ]; then 
  echo "There are only 6 numbers. Read the note."
  exit
fi

if [ "$#" -lt 5 ]; then
  echo "You need to type 6 numbers. Read the note".
  exit
fi

echo "The first number is a 4. Keep trying."
exit
```
Now expand to this. This script can be found [here](https://032.la/class.txt).
```
#!/usr/bin/env bash
#THis file expects you to type the Lost numbers "4 8 15 16 23 42"
clear

if [ $# -gt 5 ]; then
echo "There are only 6 numbers. Read the note."
exit
fi

if [ $# -lt 5 ]; then
echo "You need to type 6 numbers. Read the note."
exit
fi

if [ $1 -ne 8 ]; then
    echo "The second number is an 8"
    exit
fi

if [ $2 -ne 15 ]; then
    echo "The third number is 15"
    exit
fi

if [ $3 -ne 16 ]; then
    echo "The forth number is 16"
    exit
fi

if [ $4 -ne 23 ]; then
    echo "The fifth number is 23"
    exit
fi

if [ $5 -ne 42 ]; then
    echo "The last number is 42"
    exit
fi

echo You reset the timer. 
echo You have 108 minutes until you need to do it again.
sleep 60 
clear
echo 107 minutes...
```
# Notes
## Shebang
The first line `#!/usr/bin/env bash` is a shebang we usually include in the script. This is how we specify which interpreter is used when we execute the script.
