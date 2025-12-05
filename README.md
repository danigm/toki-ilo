# toki pona programming language

## How to build

The compiler is a gcc-frontend, so you need to compile the gcc submodule.

```
$ git submodule init gcc
$ git submodule update gcc # This will take some time, the repo is big
```

Download prerequisites:

```
$ cd gcc
$ ./contrib/download_prerequisites
$ cd -
```

After downloading the source code you can build:

```
$ mkdir build install
$ cd build
$ ../gcc/configure --prefix=$(pwd)/../install --disable-bootstrap --enable-languages=c,c++,toki
$ make -j$(getconf _NPROCESSORS_ONLN)
$ make install
$ cd -
```

After building we have now the compiler so we can compile toki.ilo source code:

```
$ install/bin/gcctoki -o toki examples/toki.ilo
$ ./toki
ma ale o, toki!
```

## Syntax highlighting in vim

```
$ cp toki.vim $HOME/.vim/syntax/
$ echo "autocmd BufRead *.ilo set syntax=toki" >> $HOME/.vimrc
```

## Hello world: 󱥬 󱥔

```
o toki e "ma ale o, toki!"
󱥄 󱥬 󱤉 "󱤰 󱤄 󱥄 󱥬"
```

## Identifiers: 󱥂

This is something to discuss, if we want to allow any kind of word, to
allow foreign language variable, objects and function identifiers or
if we should limit to toki pona.

```
chars = "ptksmnljw" + "aeiou"
not_allowed = ["wu", "wo", "ji", "ti", "wun", "won", "jin", "tin"]
valid_syllables = {
  "":  [" a", " an", " e", " en", " i", " in", " o", " on", " u", " un"],
  "p": ["pa", "pan", "pe", "pen", "pi", "pin", "po", "pon", "pu", "pun"],
  "t": ["ta", "tan", "te", "ten", "--", "---", "to", "ton", "tu", "tun"],
  "k": ["ka", "kan", "ke", "ken", "ki", "kin", "ko", "kon", "ku", "kun"],
  "m": ["ma", "man", "me", "men", "mi", "min", "mo", "mon", "mu", "mun"],
  "n": ["na", "nan", "ne", "nen", "ni", "nin", "no", "non", "nu", "nun"],
  "s": ["sa", "san", "se", "sen", "si", "sin", "so", "son", "su", "sun"],
  "l": ["la", "lan", "le", "len", "li", "lin", "lo", "lon", "lu", "lun"],
  "w": ["wa", "wan", "we", "wen", "wi", "win", "  ", "   ", "  ", "   "],
  "j": ["ja", "jan", "je", "jen", "--", "---", "jo", "jon", "ju", "jun"],
}
```

## Function call: 󱥄

Keywords: o e

Function calls starts with "o" keyword and the list of parameters are
direct objects with "e" keyword. There is no parenthesis or comma in
function calls.

Definition:
```
o IDENT (e (IDENT | LITERAL))*
```

Examples:
```
o toki e "ma ale o, toki!"
o lukin_lipu e "doc.txt"
```

## Function definition: 󱤿 󱤧

Keywords: nasin li nimi tawa jo pana ijo

To define a function we use the "nasin li nimi" keyword combination.

Definition:
```
nasin li nimi IDENT (li kama jo (e TYPE IDENT)+)?
{
    (o pana e EXPR)?
}
```

Examples:
```
# print function definition (toki)
nasin li nimi toki li kama jo e nimi s
{
...
}

# read document function definition (lukin_lipu)
nasin li nimi lukin_lipu li kama jo e nimi lipu
{
...
    o pana e 4
}
```

## Variables

Definition:
```
nimi IDENT li EXPR
```

Examples:
```
nimi nimi_mi li "jan Tanie"
nimi nanpa_tomo li 23
nimi lipu_mi li mute "doc1.txt" e "doc2.txt" e "doc3.txt"
```

## Loops

Definition:
```
o sin e ni {
    EXPR*
    o pini
}
```

## Conditional

Definition:
```
(EXPR) la {
    EXPR*
}
```

If-else:
```
(EXPR) la {
    EXPR*
} ante {
    EXPR*
}
```

## Basic Types

 * string: "abc" -> nimi
 * integer: 23 -> nanpa
 * float: 23.3 -> nanpa jaki

## Custom types (TODO)
## Import, grouping functionality (TODO)


### Reference

* The gcc frontend is built using following this tutorial:
  https://thinkingeek.com/2016/01/05/tiny-gcc-front-part-1/
* GCC Internal documentation about generic:
  https://gcc.gnu.org/onlinedocs/gccint/#toc-GENERIC-1
