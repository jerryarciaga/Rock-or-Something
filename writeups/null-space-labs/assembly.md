# Instructions and Opcodes
* All assembly languages are mnemonic
* Direct translation from instruction to binary representation
```
xor eax, eax --> 31 c0
int 0x80 --> cd 80
push
```
* **Instructions** are human readable.
* **Opcodes** are machine readable.

# Instruction lengths
* Intel has a variable length instruction set
    - Instructions range from 1-15+ bytes
    - Other languages have fixed-length instruction sets
* Most instruction *arguments* are limited by processor size.

# Our First Program
* Our program will do: `exit(10)`
{% code lineNumbers="true" %}
```asm
; This is a comment line. All text after a ; is a comment below.
; Example code for exit with return value 10

; This line tells nasm how many BITS we're programming for (NASM specific)
BITS 64

; This line makes the _start symbol available to the linker (see below) (NASM specific)
global _start

; This line is a SYMBOL which associates a line of our assembly with a given name.
; Think of symbols as markers which gets turned into a memory addresses during assembly
; _start is a special symbol that tells the linker where we'd like to start execution at
_start:
    mov rdi, 10     ; store value 10 in rdi register
    mov rax, 60     ; store value 60 in rax register (sys_exit number)
    syscall         ; perform a system call
```
{% endcode %}
## Compiling our first program
* You may need to do: `sudo apt install nasm`
* On NixOS or with `nix`: `nix-shell -p nasm`
* Assemble to object file, then link and output executable:
```
$ nasm -f elf64 code1.asm
$ ld -o exec_code1 code1.o
```
## Run our executable and look at return code
```
$ ./exec_code1
$ echo $?
```

# CPU Registers
* **Register**: a place to store data for processing on the CPU
* x86_64 registers:
    * `rax`
    * `rbx`
    * `rcx`
    * `rdx`
    * `rsi`
    * `rdi`
    * `rsp`
    * `rbp`
    * `r10`
    * `r9`
    * `r8`
    * etc

# CPU Registers Addressing
* Registers are 64 bits, but can be addressed to access smaller data sizes
    * `rax` = 64 bits
    * `eax` = 32 bits
    * `ax` = 16 bits
    * `ah` = 8 bits (high)
    * `al` = 8 bits (low)

# Special CPU Registers
* Some registers have special purposes/uses
    * `RIP`: The current instruction pointer (non writable)
    * `RBP`/`RSP`: Current stack pointers*

# Instruction Parameters
Instruction parameters can be:
* An **immediate** value, also called **literal** or **constant value**
* A register name
* A memore address, relative or literal
Each instruction allows different parameter types
* Some cannot use literal values/registers/etc
* Some limit size of parameters

# First Program (revisited)
Mov instruction format:
`mov dest, source` moves data in source to dest
```asm
mov rdi, 10 ; set rdi = 10
mov rax, 60 ; rax = 60
syscall ; call kernel
```

`man 2 exit` shows the **Linux Programmer's Manual**

# Linux System Calls
Asking the OS to provide a service to your program

# Second Example: Arithmetic
{% code lineNumbers="true" %}
```asm
; Example exit(10) with register manipulation/arithmetic
BITS 64

global _start

_start:
    mov rdi, 1
    add rdi, 9
    mov rax, 60
    syscall
```
{% endcode %}

# Control Flow Instructions
## Functions
* `call` - go to an address with the intent of *returning*
* `ret` - return to calling address

# Example 3: Function Calls
{% code lineNumbers="true" %}
```asm
; Example code for function calls
BITS 64

global _start

_start:
    call code3
    syscall

code2:
    mov rax, rdx
    call code1
    xor rdi, rdi
    add rdi, rbx
    ret

code1:
    add rax, 30
    ret

code3:
    xor rbx,rbx
    mov rbx, 20
    mov rdx, rbx
    add rdx, 10
    call code2
    ret
```
{% endcode %}

# Higher Level Control Flow Concepts
Take a look at this simple Python code
{% code lineNumbers="true" %}
```python
a = 10
if (a == 1):
    do_stuff
```
{% endcode %}
## Assembly `if` conditional
{% code lineNumbers="true" %}
```asm
mov rax, 10
cmp rax, 1
jz do_stuff
jmp exit
```
{% endcode %}
* `cmp dest, source` - compare by subtracting source from dest (do not store result in dest)
* `jz` - jump to address if result of previous instruction was *zero*
* `jmp` - jump to address, unconditionally

# Processor Flags Register
* `RFLAGS` - register which keeps track of the most recent instruction flags

# Example 4: Conditional Statement
{% code lineNumbers="true" %}
```asm
; Example conditional, check if rax == 1 
; If true, return 10, otherwise return 0

BITS 64

global _start

_start:
    xor rdi, rdi    ; set rdi = 0
    mov rax, 10
    cmp rax, 1
    jz do_stuff
    jmp exit

do_stuff
    mov rdi, 10
exit:
    mov rax, 60
    syscall
```
{% endcode %}

# Additional Common Instructions
* `sub dest, source`
* `inc asdf`
* `dec asdf`

# Assembly `for` loop
{% code lineNumbers="true" %}
```asm
; Example "for loop"

BITS 64

global _start

_start:
    xor rdi, rdi
    mov rcx, 0
loop_start: 
    call do_stuff
    inc rcx
    cmp rcx, 10
    jz _exit
    jmp loop_start

do_stuff:
    inc rdi
    ret

_exit:
    mov rax, 60
    syscall
```
{% endcode %}

# Components of a process
* **Text**: Program code
* **Stack**: Function variables, grows downward
* **Heap**: Dynamic memory/data, grows upward
* **Data**: Static data, defined
* **BSS**: Static data, undefined
* **Kernel space**

# Stack Registers
* `rsp` - stack pointer, current *head*
* `rbp` - base pointer

# Debuggers
* Debug a program
* Watch/manipulate a program while it's running
## Basic features of a debugger
* Run-time disassembly
* To disassemble a compiled program, run the following:
```
$ objdump -M intel -d exec_code
```
