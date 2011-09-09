syntax on

set nu     				" mostra o numero da linha
set numberwidth=4                       " If we have over 9999 lines, ohh, boo-hoo
set ai     				" AutoIndent: identacao automatica
set ruler  				" mostra a posicao do cursor, regua
set sm     				" ShowMatch: mostra o par do parenteses/chaves recem fechado

au BufRead,BufNewFile *.rb,*.rhtml,*.erb set tabstop=2     " ruby standard 2 spaces
au BufRead,BufNewFile *.rb,*.rhtml,*.erb set shiftwidth=2  " ruby standard 2 spaces
au BufRead,BufNewFile *.rb,*.rhtml,*.erb set softtabstop=2 " ruby standard 2 spaces


