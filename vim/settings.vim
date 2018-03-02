" Dictionary settings
set complete+=k
set iskeyword+=-
let dict = '~/.vim/dict'
for fpath in split(globpath(dict, '*.dic'), '\n')
    exe 'set dictionary+='.fpath
endfor
