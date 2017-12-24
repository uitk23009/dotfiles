" Dictionary settings
set complete+=k
set iskeyword+=-
let dict = '~/.vim/dict'
for fpath in split(globpath(dict, '*.dic'), '\n')
    exe 'set dictionary+='.fpath
endfor

" Abbr settings
let abbr = '~/.vim/abbr'
for fpath in split(globpath(abbr, '*.vim', '\n'))
    exe 'source' fpath
endfor
