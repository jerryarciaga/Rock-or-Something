> Elowen has reached the Ruins of Eldrath, where she finds a sealed rune stone glowing with ancient power. The rune is inscribed with a secret incantation that must be spoken to unlock the next step in her journey to find The Dragon’s Heart.

# Walkthrough
I downloaded the provided binary named `challenge`.
```
$ file challenge
challenge: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=47f180529af15b5a7d4601583b2944010ae6e092, for GNU/Linux 4.4.0, not stripped
```

The binary, when run, will ask for an incantation to reveal its secret. There are probably ways to get that incantation, but let's start with something simple first.

If we look at this binary just like any other data file in Linux, running `strings` pulls those printable bits of text. I truncated the output since the original output had more than 100 lines.

```
...
[1;34m
 The ancient rune shimmers with magical energy... 
Enter the incantation to reveal its secret: 
%49s
;*3$"
LmB9ZDNsNDN2M3JfYzFnNG1fM251cntCVEhgIHNpIGxsZXBzIHRlcmNlcyBlaFQ=
emFyZmZ1bkdsZWFW
GCC: (GNU) 14.2.1 20250207
main.c
_DYNAMIC
...
```

Notice anything curious? There's a string of text that looks like a base64 encoded text. Let's try decoding it:

```
$ echo LmB9ZDNsNDN2M3JfYzFnNG1fM251cntCVEhgIHNpIGxsZXBzIHRlcmNlcyBlaFQ= | base64 -d
.`}d3l43v3r_c1g4m_3nur{BTH` si lleps terces ehT
```

Now we're getting somewhere. Actually, this looks like the flag, but in reverse. Let's update our command:
```
$ echo LmB9ZDNsNDN2M3JfYzFnNG1fM251cntCVEhgIHNpIGxsZXBzIHRlcmNlcyBlaFQ= | base64 -d | rev
The secret spell is `HTB{run3_m4g1c_r3v34l3d}`.
```
