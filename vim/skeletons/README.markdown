## USAGE
Please write statements into .vimrc. Like so:

    augroup SkeletonAu
        autocmd!
        autocmd BufNewFile *.pl 0r ~/.vim/skeltons/skelton.pl
    augroup END
