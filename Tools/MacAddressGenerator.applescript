set l1 to {}
repeat 10 times
	set x to do shell script "perl -e 'printf \"%02X:%02X:%02X:%02X:%02X:%02X
\", rand 0xFF, rand 0xFF, rand 0xFF, rand 0xFF, rand 0xFF, rand 0xFF'"
	set beginning of l1 to x
end repeat
repeat
	set x to (choose from list l1 with prompt "Choose Mac Adress" without empty selection allowed)
	if x is false then
		exit repeat
	else
		set the clipboard to x as string
	end if
end repeat