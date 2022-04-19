# Elba.jl
## Instructions

To go from Albanian to Elbasani
```
Elba.atoe("si je?") 
```

To go from Elbasani to Albanian:
```
Elba.atoe("𐔐𐔇 𐔝𐔈 𐔏𐔞𐔇𐔌𐔇𐔒𐔍 𐔝𐔇 𐔚𐔈𐔕𐔈𐔝 𐔝𐔖𐔓𐔀") 
```

## Repl Mode:
For rapid translate you can enter repl mode:

```
Elba.atoe_repl()
```

Or

```
Elba.etoa_repl()
```

CTRL-C to Exit

## Future features:
- [ ] Backspace in repl mode
- [ ] Hook into julia Repl and add colored prompt/make it pretty
- [ ] Switch easily between repl modes like Julia repl
- [ ] Handle Edge cases. There are a few edgecases in the language that are not currently handled

## Getting Started
Install Julia

Then To get this repo
```
git clone git@github.com:egajda/Elba.jl.git
cd Elba.jl
julia --project
using Elba
```

Finally you can now call atoe, etoa, or either repl commands
```
atoe_repl()
```
or
```
etoa_repl()
```
or
```
atoe("𐔐𐔇 𐔝𐔈 𐔏𐔞𐔇𐔌𐔇𐔒𐔍 𐔝𐔇 𐔚𐔈𐔕𐔈𐔝 𐔝𐔖𐔓𐔀") 
```


Remember the most important thing is to have fun!

