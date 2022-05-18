https://vi.stackexchange.com/a/515/26821


# resizing

Ctrl+W +/-: increase/decrease height (ex. 20<C-w>+)
Ctrl+W >/<: increase/decrease width (ex. 30<C-w><)
Ctrl+W _: set height (ex. 50<C-w>_)
Ctrl+W |: set width (ex. 50<C-w>|)
Ctrl+W =: equalize width and height of all windows

# nav

`gd` - go to definition (coc.vim)
`gy` - go to type definition (coc.vim)
`gi` - go to implementation (coc.vim)
`gr` - go to references (coc.vim)


- fuzzy search
  - using `fzf`, accessible with `Ctrl-P`

# files and directories
`:e %:h/filename` - create a new file in this directory (dont forget to `:w` to save it)
  - https://stackoverflow.com/questions/13239464/create-a-new-file-in-the-directory-of-the-open-file-in-vim

`:saveas new.txt` - duplicate the open file under new name

`<C+s>` - exit to normal mode and save
