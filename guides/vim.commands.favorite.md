
# navigation

`'.` = go to last updated line
`{` = go up a paragraph
`}` = go back a paragraph
`$` = go to end of line
`^` = go to beginning of non-blank of line
`%` = go to corresponding item (e.g. from an open brace to its matching closing brace)

- jump list
  - `:jump` to view jumplist
  - `C+O` to jump back
  - `C+I` to jump forward

`gd` - go to definition (coc.vim)
`gy` - go to type definition (coc.vim)
`gi` - go to implementation (coc.vim)
`gr` - go to references (coc.vim)


# actions

`:%s/find/replace/g` = find and replace based on regexp + customizable line selectors
  - command (`:`)
  - search all lines (`%s`)
  - find all substrings matching regexp `/find/`
  - replace all substrings matching pattern with `replace` (`replace/`)
  - with `g` regexp flag
`cs'"` = change surround from `'` to `"`
  - https://stackoverflow.com/a/61935629/3068233
`ysiw'` = add surround `'` to word
  - https://stackoverflow.com/a/61935629/3068233
  - power examples
    - `ysiw{` = add brackets around word
    - `ysiwt` = add a tag around word
`viwp` = paste contents of a register over a visually selected 'in-word'
  - refs
    - https://stackoverflow.com/a/19861367/3068233
  - power examples
    - `vsiw"0p` to send the overwritten value into a different register
`ctrl-r 0` = paste the contents of the register `0`
  - usage
    - especially helpful if you want to `ciw` and paste a value from a register
  - refs
    - https://stackoverflow.com/a/51048624/3068233
    - https://medium.com/usevim/vim-101-ctrl-r-c9b9b6812f4c
  - power examples
    - `ctrl-r 10*20`, for letting vim do calculations for you

# registers
> "* - selection register (middle-button paste)
> "+ - clipboard register (probably also accessible with ctrl-shift-v via the terminal)
> "" - vim's default (unnamed) yank/put/change/delete/substitute register.
> "_ - blackhole register (colloquially)

- https://stackoverflow.com/a/2471282/3068233

# refs
- https://vim.fandom.com/wiki/Moving_around

