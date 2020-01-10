" Let F7 insert current time to current location.
map <F7> i<C-R>=strftime("%Y/%m/%d %H:%M:%S")<ESC><ESC>
map! <F7> <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR>

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" map <c-w><c-t> :WMToggle<CR> 
" map <c-w><c-f> :FirstExplorerWindow<CR>
" map <c-w><c-b> :BottomExplorerWindow<CR>
map <C-W><C-T> :tabnew<CR>

nmap <C-DOWN> <C-W>j
nmap <C-UP> <C-W>k
nmap <C-LEFT> <C-W>h
nmap <C-RIGHT> <C-W>l

nmap <C-TAB> :tabnext<CR>
nmap <C-S-TAB> :tabprev<CR>
nmap <A-1> :tabn1<CR>
nmap <A-2> :tabn2<CR>
nmap <A-3> :tabn3<CR>
nmap <A-4> :tabn4<CR>
nmap <A-5> :tabn5<CR>
nmap <A-6> :tabn6<CR>
nmap <A-7> :tabn7<CR>
nmap <A-8> :tabn8<CR>
nmap <A-9> :tabn9<CR>
nmap <A-0> :tabn10<CR>

nmap <TAB> <C-W>w
nmap <S-TAB> <C-W>W

nmap <C-N> :bnext<CR>
nmap <C-P> :bprev<CR>

nmap ZZ :echo "disabled!"<CR>

" NerdTree
nmap <F1> :NERDTreeToggle<CR>
nmap <S-F1> :NERDTree<CR>

" Display or change CWD
nmap <F2> :pwd<CR>
nmap <S-F2> :cd %:p:h<CR>

nmap <F3> :BufExplorer<CR>
nmap <F4> :BufExplorer<CR>
nmap <F5> :SyntasticCheck<CR>

" Let F7 insert current time to current location.
nmap <F7> i<C-R>=strftime("%Y-%m-%d %H:%M:%S")<ESC><ESC>
imap <F7> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
nmap <S-F7> i<C-R>=strftime("%Y/%m/%d %H:%M:%S")<ESC><ESC>
imap <S-F7> <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR>
nmap <C-F7> i<C-R>=strftime("%Y-%m-%d)<ESC><ESC>
imap <C-F7> <C-R>=strftime("%Y-%m-%d)<CR>
nmap <A-F7> i<C-R>=strftime("%Y/%m/%d)<ESC><ESC>
imap <A-F7> <C-R>=strftime("%Y/%m/%d)<CR>

nmap <F8> <Plug>TaskList

nmap <C-F12> :call CtagsCmd()<CR>
nmap <F12> :Tlist<CR>

" Indent in v mode
vmap <TAB> >gv
vmap <S-TAB> <gv

imap <C-CR> <CR><ESC>O
imap <S-CR> <ESC>O

" TaskList TODOList
nmap <Leader>tdl <Plug>TaskList

