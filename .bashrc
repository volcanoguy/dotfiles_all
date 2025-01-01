#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ll='exa --all --tree --level=2 --color'
alias ls='ls -latrh --color'
alias vim='nvim'
alias vi='nvim'
alias btop='btop --utf-force'
alias du='du -h --max-depth=1'
alias tmux='tmux -u'

# alias grep='grep --color=auto'

eval "$(starship init bash)"

export PATH="$HOME/.cargo/bin:$PATH"
source "$HOME/.rye/env"

# Source fzf key bindings and fuzzy completion
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash
export FZF_COMPLETION_TRIGGER='~~'

rga-fzf() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
      fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	echo "opening $file" &&
	xdg-open "$file"
}

# reducevideosize() {
#   echo "use this only for filesize>1GiB" 
#   original_filename=$1  
#   filename="${original_filename%.*}"
#   extension="${original_filename##*.}"
#   echo ffmpeg -i "${original_filename}" -c:v libx264 -preset ultrafast -crf 25 -c:a aac -b:a 128k -vf scale=1280:720 "${filename}_OUTPUT.${extension}"
#   ffmpeg -i "${original_filename}" -c:v libx264 -preset ultrafast -crf 25 -c:a aac -b:a 128k -vf scale=1280:720 "${filename}_OUTPUT.${extension}"
# }

yaycleanup() {
  orphaned=$(pacman -Qdtq)
  if [ -n "$orphaned" ]; 
    then
      sudo /usr/bin/pacman -Rcns $orphaned #--noconfirm
  fi
  sudo /usr/bin/pacman -Svcc --noconfirm
}

export GOPATH=~/.local/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

export CDPATH=.:~
alias practice_golang="cd ~/Practice/golang/zerotomastery.io-golang/src/lectures/exercise && ll"
export EDITOR=nvim


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# autocomplete for kubecolor
complete -o default -F __start_kubectl kubecolor
