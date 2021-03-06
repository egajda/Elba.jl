"""
Instructions

To go from Albanian to Elbasani
```
Elba.atoe("si je?") 
```

To go from Elbasani to Albanian:
```
Elba.atoe("๐๐ ๐๐ ๐๐๐๐๐๐๐ ๐๐ ๐๐๐๐๐ ๐๐๐๐") 
```

Repl Mode:
For rapid translate you can enter repl mode:

```
Elba.atoe_repl()
```

Or

```
Elba.etoa_repl()
```

CTRL-C to Exit

Future features:
- [ ] Backspace in repl mode
- [ ] Hook into julia Repl and add colored prompt/make it pretty
- [ ] Switch easily between repl modes like Julia repl
- [ ] Handle Edge cases. There are a few edgecases in the language that are not currently handled
"""
module Elba

export etoa, atoe
export etoa_repl, atoe_repl

abetare_info = Dict(
    "๐" => ("a", "[a ษ ษ]"),
    "๐" => ("b", "[b]"),
    "๐" => ("c", "[ts]"),
    "๐" => ("รง", "xh [tส], [dส][5]"),
    "๐" => ("d", "[d]"),
    "๐" => ("n","d [nd]"),
    "๐" => ("d","h [รฐ]"),
    "๐" => ("e", "[e ษ][5]"),
    "๐" => ("รซ", "[ษ][5]"),
    "๐" => ("f", "[f]"),
    "๐" => ("g", "[ษก]"),
    "๐" => ("gj", "[ษ]"),
    "๐" => ("h", "[h ฤง]"),
    "๐" => ("i", "[i]"),
    "๐" => ("j", "[j]"),
    "๐" => ("k", "[k q]"),
    "๐" => ("l", "[l]"),
    "๐" => ("ll", "[ษซ]"),
    "๐" => ("m", "[m]"),
    "๐" => ("n", "[n]"),
    "๐" => ("n", "(before g and gj) [n][5]"),
    "๐" => ("nj", "[ษฒ]"),
    "๐" => ("o", "[o ษ]"),
    "๐" => ("p", "[p]"),
    "๐" => ("q", "[tษ]"),
    "๐" => ("r", "[ษพ]"),
    "๐" => ("rr", "[r]"),
    "๐" => ("s", "[s]"),
    "๐" => ("sh", "[ส]"),
    "๐" => ("t", "[t]"),
    "๐" => ("th", "[ฮธ]"),
    "๐" => ("u", "[u]"),
    "๐ " => ("v", "[v]"),
    "๐ก" => ("x", "[dz]"),
    "๐ข" => ("y", "[y]"),
    "๐ฃ" => ("z", "[z]"),
    "๐ค" => ("zh", "[ส]"),
    "๐ฅ" => ("gh", "[ษฃ] (Greek loanwords)"),
    "๐ฆ" => ("gh", "[ษฃ] (Greek loanwords)"),
    "๐ง" => ("kh", "[x] (Greek loanwords)"),
)
function make_alphabet()
    list = zip(keys(abetare_info), first.(values(abetare_info)))
    alphabet = map(x -> x, list)
end
alphabet = make_alphabet()

function make_etoa()
    etoa = Dict()
    map(x->etoa[x[1]] = x[2], alphabet)
    return etoa
end

function make_atoe()
    etoa = Dict()
    map(x->etoa[x[2]] = x[1], alphabet)
    return etoa
end

etoa_dict = make_etoa()
atoe_dict = make_atoe()

etoa_char(char) = etoa_dict[char]
atoe_char(char) = atoe_dict[char]

digraphs = filter(x-> length(x) == 2, keys(atoe_dict))

function atoe(string)
    string = lowercase(string)
    for digraph in digraphs
        string = replace(string, digraph => atoe_char(digraph))
    end
    for i in string
        i = "$i"
        if i in last.(alphabet)
            string = replace(string, i => atoe_char(i))
        else
        end
    end
    return string
end

function etoa(string)

    for i in string
        try
            i = "$i"
            string = replace(string, i => etoa_char(i))
        catch
        end
    end
    return string
end

function etoa_repl()
    @info "Elbasan => Albanian"
    while true
       l = readline()
       println(etoa(l))
       if l == "exit"
           error("interrupt")
       end
   end
end

function atoe_repl()
    @info "Albanian => Elbasan" "exit with CTRL-C"
    while true
       l = readline()
       println(atoe(l))
       if l == "exit"
           error("interrupt")
       end
   end
end

end

#test1 = "๐๐ ๐๐ ๐๐๐๐๐๐๐ ๐๐ ๐๐๐๐๐ ๐๐๐๐"
#println(Elba.etoa(test1))

