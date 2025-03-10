# Rules
This file describes the rules in depth.


# WORK IN PROGRESS
**This document is not finished and subject to change. Although the general
content idea will stay the same, some details could change**

## Important notes
Please keep in mind that we, the organizers, are organizing this hackathon to
have fun, and want other people to have fun as well. We put in our own free time
into organizing this, so please don't start rule lawyering, trying to find
loopholes or just generally messing around.

Also, although we have listed these rules here for clarity, please keep in mind
that the idea of the hackathon is to build a chess-bot **completely** on your own.
*Please use common sense.*

## Questions?
Is a rule unclear, or would you just like to check if you understood it
properly. Feel free to send the organizers a message on slack or approach them
in person.

### General rules
- The source code, including a working Makefile, must be submitted via the form
in the expected format. Please see the "Submitting" section for more info.
- You are allowed to submit up to 3 bots max per team. The highest scoring bot
will be the only one that determines your placing in your league.

### Team rules
- Team sizes:
    - **Minor league:**       max 3 Codam students
    - **Major league:**   max 2 Codam students and/or alumni

### General code rules
- All code must be written during the event. This means no preparing code in
advance.
- All code must be written by your team and your team only. This means no
generative AI (i.e. ChatGPT, Copilot etc.)  or asking a "friend" to write the
code for you.
- Unless explicitly allowed, the usage of external libraries is forbidden. This
includes "standard" libraries included in some programming languages. See
"Allowed libraries" for more info
- No execve-ing etc. of code that does not adhere to the rules.
- No networking code
- No trying to exploit any vulnerabilities in any of the programs used in the
tournament (VM, tournament program, your opponents program, etc.)
- You must submit a commit at the end of the day of each day of the hackathon.
(This is to see if someone is cheating)


## Allowed libraries/external functions

Please note that, although these are categorized by their language, you are
allowed to call any of the allowed library functions from any of the allowed
languages. This means that you're allowed to for example:
- Call C standard library functions from Rust
- Call C++ standard library functions from C
- Call Rust standard library functions from python
- ...

### General
- Linux syscalls and their wrappers

*Note: Some syscalls will be disabled (fork, clone, etc.) and/or limited during
the tournament (mmap, (s)brk, etc.), see the VM info file for more information
about the environment the bots will be in.

### C
- C standard library, from ANSI C to C23
- GNU C standard library extensions
- GCC and clang extensions/compiler built-ins

### C++
- C++ standard library, from C++98 to C++23
- GNU C++ standard library extensions
- GCC and clang extensions/compiler built-ins

### Rust
- Rust standard library
- `rand`

### Python
- Python standard library
- Numpy
- Scipy
