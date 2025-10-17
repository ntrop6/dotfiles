if status is-interactive
    # Commands to run in interactive sessions can go here
end

fastfetch --logo /home/ntrop/ASCII
alias sudo='sudo-rs'
alias sudoedit='sudo-rs rnano'
alias setimg='sh /home/ntrop/.config/setimage.sh'

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
