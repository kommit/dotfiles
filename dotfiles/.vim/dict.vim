" set root directory of DICTIONARY, whose value by default is 
" the user's HOME directory.
let g:PATH_TO_DICT=g:MYDIR."/dict/"

" add dictionary
fun! SetDic(operationType, headOrtail, ...)
	fun! ReduceDicFromDictionary(dicName)
		if has("win32")
			let &dictionary=substitute(&dictionary, 
						\ a:dicName."\\>", "", "g")
		else
			let &dictionary=substitute(expand(&dictionary), 
						\ expand(a:dicName)."\\>", "", "g")
		endif
	endfun
	if a:operationType ==? "set"
		let &dictionary=""
	elseif a:operationType ==? "nowords"
		call ReduceDicFromDictionary(g:PATH_TO_DICT."words")
		" else a:operationType equals to *add*
	endif

	if a:operationType ==? "add" || a:operationType ==? "nowords" ||
				\ a:operationType ==? "set"
		" let the new Dictionary at head.
		if a:headOrtail ==? "head"
			let idx = a:0
			while idx > 0 
				call ReduceDicFromDictionary(g:PATH_TO_DICT.a:{idx})
				let &dictionary=g:PATH_TO_DICT . a:{idx} . "," . &dictionary
				let idx = idx - 1
			endwhile
			" add the new Dictionary at tail.
		elseif a:headOrtail ==? "tail"
			let idx = 1
			while idx <= a:0
				call ReduceDicFromDictionary(g:PATH_TO_DICT.a:{idx})
				let &dictionary=&dictionary . "," . g:PATH_TO_DICT . a:{idx} 
				let idx = idx + 1
			endwhile
		endif
	elseif a:operationType ==? "dec"
		let idx = 1
		while idx <= a:0
			call ReduceDicFromDictionary(g:PATH_TO_DICT.a:{idx})
			let idx = idx + 1
		endwhile
	endif

	let &dictionary = substitute(&dictionary, ",,", ",", "g")
	let &dictionary = substitute(&dictionary, "^,", "", "g")
	let &dictionary = substitute(&dictionary, ",$", "", "g")
endfunction


" set default 'dictionary' path
if ! &dictionary
	call SetDic("set", "head", "words")
endif

