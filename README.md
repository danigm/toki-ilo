# toki pona programming language

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
nasin li nimi IDENT
(kama jo (e ijo TYPE)+)?
(pana ijo TYPE)?
{
}
```

Examples:
```
# print function definition (toki)
nasin li nimi toki
kama jo e ijo nimi mute
{
...
}

# read document function definition (lukin_lipu)
nasin li nimi lukin_lipu
kama jo e ijo nimi mute
pana ijo lipu
{
...
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

## Loops (TODO)

Definition:
```
pali sike {
    EXPR*
    pakala
}
```

## Conditional (TODO)
## Basic Types (TODO)
## Custom types (TODO)
## Import, grouping functionality (TODO)
