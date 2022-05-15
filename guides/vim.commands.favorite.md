
# navigation

`'.` = go to last updated line
`{` = go up a paragraph
`}` = go back a paragraph
`$` = go to end of line
`^` = go to beginning of non-blank of line
`%` = go to corresponding item (e.g. from an open brace to its matching closing brace)

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

# refs
- https://vim.fandom.com/wiki/Moving_around

