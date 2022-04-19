"""
Instructions

To go from Albanian to Elbasani
```
Elba.atoe("si je?") 
```

To go from Elbasani to Albanian:
```
Elba.atoe("𐔐𐔇 𐔝𐔈 𐔏𐔞𐔇𐔌𐔇𐔒𐔍 𐔝𐔇 𐔚𐔈𐔕𐔈𐔝 𐔝𐔖𐔓𐔀") 
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
    "𐔀" => ("a", "[a ɑ ɒ]"),
    "𐔁" => ("b", "[b]"),
    "𐔂" => ("c", "[ts]"),
    "𐔃" => ("ç", "xh [tʃ], [dʒ][5]"),
    "𐔄" => ("d", "[d]"),
    "𐔅" => ("n","d [nd]"),
    "𐔆" => ("d","h [ð]"),
    "𐔇" => ("e", "[e ɛ][5]"),
    "𐔈" => ("ë", "[ə][5]"),
    "𐔉" => ("f", "[f]"),
    "𐔊" => ("g", "[ɡ]"),
    "𐔋" => ("gj", "[ɟ]"),
    "𐔌" => ("h", "[h ħ]"),
    "𐔍" => ("i", "[i]"),
    "𐔎" => ("j", "[j]"),
    "𐔏" => ("k", "[k q]"),
    "𐔐" => ("l", "[l]"),
    "𐔑" => ("ll", "[ɫ]"),
    "𐔒" => ("m", "[m]"),
    "𐔓" => ("n", "[n]"),
    "𐔔" => ("n", "(before g and gj) [n][5]"),
    "𐔕" => ("nj", "[ɲ]"),
    "𐔖" => ("o", "[o ɔ]"),
    "𐔗" => ("p", "[p]"),
    "𐔘" => ("q", "[tɕ]"),
    "𐔙" => ("r", "[ɾ]"),
    "𐔚" => ("rr", "[r]"),
    "𐔛" => ("s", "[s]"),
    "𐔜" => ("sh", "[ʃ]"),
    "𐔝" => ("t", "[t]"),
    "𐔞" => ("th", "[θ]"),
    "𐔟" => ("u", "[u]"),
    "𐔠" => ("v", "[v]"),
    "𐔡" => ("x", "[dz]"),
    "𐔢" => ("y", "[y]"),
    "𐔣" => ("z", "[z]"),
    "𐔤" => ("zh", "[ʒ]"),
    "𐔥" => ("gh", "[ɣ] (Greek loanwords)"),
    "𐔦" => ("gh", "[ɣ] (Greek loanwords)"),
    "𐔧" => ("kh", "[x] (Greek loanwords)"),
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

#test1 = "𐔐𐔇 𐔝𐔈 𐔏𐔞𐔇𐔌𐔇𐔒𐔍 𐔝𐔇 𐔚𐔈𐔕𐔈𐔝 𐔝𐔖𐔓𐔀"
#println(Elba.etoa(test1))

