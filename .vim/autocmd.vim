" Only do this part when compiled with support for autocommands.
if has("autocmd")

	" with ( set viminfo='20,\"50 ) can remember the last position
	" of edited file.
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line ("'\"") <= line("$") |
				\ exe "normal g'\"" |
				\ endif

	autocmd BufWritePre,FileWritePre,FileAppendPre * call UpdateTimestamp()

	augroup cprog
		" Remove all cprog autocommands
		au!

		"""""""""""""""""""""""""""""""""""""""""""""""""*
		autocmd FileType *	 call PLAIN()
		fun! PLAIN()
			set comments& " reset comments to be default 

			" text auto formation mode. 
			" r -> <ENTER> then add comment leader
			" o -> o/O then add comment leader
			set formatoptions+=tcrqvmMB

			syntax sync fromstart
		endfun " endfun PLAIN
		"""""""""""""""""""""""""""""""""""""""""""""""""C
		autocmd FileType c	call C()
		fun! C()
			set cindent
			set tabstop=2
			set shiftwidth=2
			set comments=sr:/*,mb:*,el:*/,://
			set commentstring=\ \ //\ %s\  " last space
			set expandtab
			set tags+=/usr/include/tags 
			call SetDic("nowords", "tail", "c")
		endfun " endfun C
		"""""""""""""""""""""""""""""""""""""""""""""""""CPP
		autocmd FileType cpp  call CPP()
		fun! CPP()
			set cindent
			set tabstop=2
			set shiftwidth=2
			set comments=sr:/*,mb:*,el:*/,://
			set commentstring=\ \ //\ %s\  " last space
			set expandtab
			set tags+=/usr/include/tags 
			call SetDic("nowords", "tail", "cpp")
		endfun " endfun CPP
		"""""""""""""""""""""""""""""""""""""""""""""""""JAVA
		autocmd FileType java call JAVA() 
		fun! JAVA()
			set cindent 
			set commentstring=\ \ //\ %s\  " last space
			set expandtab
			set shiftwidth=2
			set tabstop=4
			set softtabstop=2
			set tags+=$JAVA_HOME/tags
			call SetDic("nowords", "tail", "java")
			nmap <C-F5> :!java %:t:r<CR>
			nmap <C-F9> :!javac %<CR>
		endfun " endfun JAVA
		"""""""""""""""""""""""""""""""""""""""""""""""""JSP
		autocmd FileType jsp call JSP() 
		fun! JSP()
			call JAVA()
			call SetDic("dec", "", "words", "java")
			call SetDic("nowords", "tail", "jsp", "java", "html", "js")
			call JKKeyMap()
		endfun " endfun JSP
		"""""""""""""""""""""""""""""""""""""""""""""""""JSP
		autocmd FileType aspvbs call ASPVBS() 
		fun! ASPVBS()
			set ignorecase
			call HTML()
		endfun " endfun ASPVBS
		"""""""""""""""""""""""""""""""""""""""""""""""""JS
		autocmd FileType js call JS() 
		fun! JS()
			set expandtab
			"call SetDic("nowords", "tail", "js")
		endfun " endfun JS
		"""""""""""""""""""""""""""""""""""""""""""""""""HTML
		autocmd FileType html call HTML()
		fun! HTML()
			set expandtab
			call SetDic("nowords", "tail", "js", "html")
			call JKKeyMap()
		endfun " endfun HTML
		"""""""""""""""""""""""""""""""""""""""""""""""""XML
		autocmd FileType xml call XML()
		fun! XML()
			set expandtab
			let g:xml_syntax_folding = 1
			call SetDic("nowords", "tail", "xml")
			call JKKeyMap()
		endfun " endfun XML
		"""""""""""""""""""""""""""""""""""""""""""""""""PERL
		autocmd FileType sed,awk,perl call PERL()
		fun! PERL()
			set expandtab
			set cindent
			set commentstring=\ \ #\ %s\  " last space
			" append dictionary
			call SetDic("nowords", "tail", "perl")
		endfun " endfun PERL
		"""""""""""""""""""""""""""""""""""""""""""""""""PHP
		autocmd FileType php call PHP()
		fun! PHP()
			set expandtab
			call SetDic("nowords", "tail", "php")
		endfun " endfun PHP
		"""""""""""""""""""""""""""""""""""""""""""""""""TeX
		autocmd FileType tex call TeX()
		fun! TeX()
			set foldmethod=marker
			set commentstring=\ \ \%\ %s\  " last space
			set expandtab
			call SetDic("nowords", "tail", "tex")
		endfun " endfun TeX
		"""""""""""""""""""""""""""""""""""""""""""""""""MP
		autocmd FileType mp call MP()
		fun! MP()
			set foldmethod=marker
			set commentstring=\ \ \%\ %s\  " last space
			set expandtab
			call SetDic("nowords", "tail", "tex", "mp")
		endfun " endfun MP
		"""""""""""""""""""""""""""""""""""""""""""""""""end
		autocmd FileType vb call VB()
		fun! VB()
			set commentstring=\ \ \'\ %s\  " last space
			set ignorecase
			set expandtab
		endfun " endfun MP
		"""""""""""""""""""""""""""""""""""""""""""""""""end
		au BufNewFile,BufRead *.js		call JavaScript()	
		fun! JavaScript()
			setlocal autoindent
			setlocal smartindent
			set ft=javascript
			set expandtab
			set commentstring=/*\ %s\ */

			" javascript syntax
			let g:javascript_enable_domhtmlcss=1
		endfun

		au BufNewFile,BufRead *.py		call Python()	
		fun! Python()
			setlocal autoindent
			setlocal smartindent
			set ft=python
			set expandtab
			set commentstring=\ \ #\ %s\  " last space
            set textwidth=1000
		endfun

		au BufNewFile,BufRead *.lua,*.wlua	call Lua()	
		fun! Lua()
			setlocal autoindent
			setlocal smartindent
			set ft=lua
			set expandtab
			set commentstring=\ \ -\ %s\  " last space
		endfun
	augroup END

	augroup gzip
		" Remove all gzip autocommands
		au!

		" Enable editing of gzipped files
		" set binary mode before reading the file
		autocmd BufReadPre,FileReadPre	  *.gz,*.bz2 set bin
		autocmd BufReadPost,FileReadPost	*.gz call GZIP_read("gunzip")
		autocmd BufReadPost,FileReadPost	*.bz2 call GZIP_read("bunzip2")
		autocmd BufWritePost,FileWritePost	  *.gz call GZIP_write("gzip")
		autocmd BufWritePost,FileWritePost	  *.bz2 call GZIP_write("bzip2")
		autocmd FileAppendPre			 *.gz call GZIP_appre("gunzip")
		autocmd FileAppendPre			 *.bz2 call GZIP_appre("bunzip2")
		autocmd FileAppendPost		  *.gz call GZIP_write("gzip")
		autocmd FileAppendPost		  *.bz2 call GZIP_write("bzip2")

		" After reading compressed file: Uncompress text in buffer with "cmd"
		fun! GZIP_read(cmd)
			" set 'cmdheight' to two, to avoid the hit-return prompt
			let ch_save = &ch
			set ch=3
			" when filtering the whole buffer, it will become empty
			let empty = line("'[") == 1 && line("']") == line("$")
			let tmp = tempname()
			let tmpe = tmp . "." . expand("<afile>:e")
			" write the just read lines to a temp file "'[,']w tmp.gz"
			execute "'[,']w " . tmpe
			" uncompress the temp file "!gunzip tmp.gz"
			execute "!" . a:cmd . " " . tmpe
			" delete the compressed lines
			'[,']d
			" read in the uncompressed lines "'[-1r tmp"
			set nobin
			execute "'[-1r " . tmp
			" if buffer became empty, delete trailing blank line
			if empty
				normal Gdd''
			endif
			" delete the temp file
			call delete(tmp)
			let &ch = ch_save
			" When uncompressed the whole buffer, do autocommands
			if empty
				execute ":doautocmd BufReadPost " . expand("%:r")
			endif
		endfun

		" After writing compressed file: Compress written file with "cmd"
		fun! GZIP_write(cmd)
			if rename(expand("<afile>"), expand("<afile>:r")) == 0
				execute "!" . a:cmd . " <afile>:r"
			endif
		endfun

		" Before appending to compressed file: Uncompress file with "cmd"
		fun! GZIP_appre(cmd)
			execute "!" . a:cmd . " <afile>"
			call rename(expand("<afile>:r"), expand("<afile>"))
		endfun

	augroup END

	" This is disabled, because it changes the jumplist.  Can't use CTRL-O to go
	" back to positions in previous files more than once.
	if 0
		" When editing a file, always jump to the last cursor position.
		" This must be after the uncompress commands.
		autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif
	endif

endif " has("autocmd")

