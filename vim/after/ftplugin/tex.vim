setlocal spell

map <buffer> <leader>c :!pdflatex %<CR>
map <buffer> <leader>r :!zathura %:p:r.pdf & disown<CR>
