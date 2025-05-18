# Description
> Brand new authentication server, zero security vulnerabilities.
`nc psycho.chal.cyberjousting.com 1353`

# Source code
{% code title="hash_psycho.py" lineNumbers="true" %}
```python
FLAG = "byuctf{}"

class User:
    def __init__(self, username, id):
        self.username = username
        self.id = id
    
    def __eq__(self, other):
        return self.id == other.id
    
    def __hash__(self):
        return hash(self.id)
    
ADMIN = User('admin', 1337)

print("Welcome to onboarding! I'm Jacob from HR, and I'm here to make your experience as seamless as possible joining the company")
print("Go ahead and tell me your name:")
name = input()
print("Welcome to the company, " + name)
print("We also give you a user id, but in an attempt to make this company feel like home, we've decided to give you a choice in that, too. Go ahead and choose that now:")
id_ = input()
if not all([i in '0987654321' for i in id_]):
    print("That's not an id!")
    quit()
id_ = int(id_)
if id_ == 1337:
    print("Sorry, the admin already claimed that id, no can do")
    quit()
YOURUSER = User(name, id_)
print("Okay, you're all set! Just head into your office. The admin's is right next door, but you can just ignore that")
print("""*You realize you have freedom of choice. Choose a door*
      1) your office
      2) the admin's office
""")
choice = int(input())
if choice == 1:
    if hash(YOURUSER) == hash(YOURUSER):
        print("Man, this is a nice office")
        quit()
    else:
        print("Hey, HR, my key doesn't work yet!")
        quit()
elif choice == 2:
    if hash(YOURUSER) == hash(ADMIN):
        print(FLAG)
        quit()
    else:
        print("The HR guy tackles you to the ground for insolence")
        quit()
```
{% endcode %}

# Interacting with the Server
TODO: add screenshot of terminal.

When you connect to their server or simply run the Python script, it asks for a name and lets you pick an id. After that, you are given a choice to go to your office (Option 1) or attempt to go to the admin's office (Option 2). Option 1 lets you in your office. Choosing option 2 will result in HR kicking you out since you are not admin. The program ends either way. Additionally, you are not allowed to use ID number 1337 (the administrator's ID number).

# Reading the code

## Interface
The script defines a `User` class allowing you to define properties `username` and `id`. The interface, starting from line 16, would ask you a name and ID number, stored in variables `name` and `id_`, respectively. For the `id_` variable, you are not allowed to specify a character other than `0987654321`, not even a negative sign. Both values are then used to create a `User` object with those properties.

## Admin User
The admin's ID number is 1337. You cannot use this during the onboarding process. However, it doesn't strictly check for the value, but rather the `hash` of the value, as seen in line 44 of the source code. This is our way in.

# Writeup

## Thought process
The condition to satisfy in order to get the flag is to set the `id_` value such that `hash(id_) = hash(1337)`. The fact that we are only allowed to type in numerical characters narrowed down the scope to only positive integers.

## Initial attempt
At first, I thought it would be a good idea to calculate the `hash` of every number starting from 1. Remember, we are only allowed to type in positive integers, so I wrote a simple bruteforcing script:

{% code title="solver.py" lineNumbers="true" %}
```python
id = 0
while hash(id) != hash(1337):
    print(f'Trying {id}...)
    id += 1
print(f'Found it! {id}')
```
{% endcode %}

I ran this while attempting other challenges, hoping for a collision. When I ran `hash` using the Python REPL, I notice that for all the numbers I've tested so far, the hash of a number is equal to the number itself.
