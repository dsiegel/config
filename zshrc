# .zshrc by Jordan Lewis

# Environment variables {{{
HISTFILE=~/.zshhistory            # What histfile are we using?
HISTSIZE=100000                   # Big = better
SAVEHIST=7000                     # When to save to the file?
export SHELL=`which zsh`                 # New shells don't open bash
export EDITOR=vim                        # Use vim!
export GREP_OPTIONS='--color=auto'       # Color my greps
if [ $(uname) = Linux ]; then
    alias ls='ls --color=auto'
else
    export CLICOLOR=1
fi
export NNTPSERVER=news-server.nyc.rr.com # Use my ISP's news server
export PERL5LIB='/Users/jlewis/.perl/'
export PATH=~/bin:$PATH
typeset -U PATH
export IDEA_JDK=/usr/lib/jvm/java-6-sun
export PYTHONPATH=~/r/utils/lib/python
export KNEWTON_REPO=~/r
export KNEWTON_CONF=$KNEWTON_REPO/configurations/virtual-development-server

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm use 1.9.2

# load private knewton environment
[[ -s "$HOME/.knewton_env" ]] && source "$HOME/.knewton_env"

# }}}
# Setopts {{{
setopt auto_cd             # If I type a directory, assume I mean to cd to it
setopt auto_pushd          # Automatically push directories onto the stack
setopt badpattern          # Print an error message on badly formed glob
#setopt cdablevars          # So we can cd to metachars like ~
setopt correctall          # Attempt typo corrections
setopt complete_in_word    #
#setopt extended_glob       # Allow ~ # ^ metachars in globbing
# disabled - this makes it so you can't use the ^ revision spec thing with git!
setopt extended_history    # More information in history
setopt hist_ignore_space   # Don't put space-prepended commands in the history
setopt interactivecomments # Allow comments even in the interactive shell
setopt listpacked          # Menucomplete can use different col widths
setopt magicequalsubst     # echo foo=~/bar -> foo/home/jlewis/bar
#setopt markdirs            # Append / to all glob-completed dirs
# disabled - given a dirtree foo/bar/baz.txt, cp -R foo/* /tmp/ causes baz.txt
# to be sent to /tmp/. no good!
setopt multios             # Allow multiple redirection!
setopt nobeep              # Don't beep
setopt no_flowcontrol      # No stupid flow control!
setopt nullglob            # Delete a glob if it doesn't match anything
setopt promptsubst
setopt pushd_ignore_dups   # Don't push multiple copies of a directory
# }}}
# Autoloads {{{
autoload -U compinit; compinit
autoload -U predict-on
autoload -U edit-command-line
autoload -U copy-earlier-word
autoload -U add-zsh-hook
# }}}
# Zle {{{
zle -N predict-on;
zle -N predict-off;
zle -N edit-command-line
zle -N copy-earlier-word
# }}}
# Zstyles {{{
zstyle ':completion::complete:*' use-cache 1 # uses completion cache
zstyle ':completion::complete:*' cache-path ~/.zshcache
zstyle ':completion:*' menu select # menu-style completion
zstyle ':completion:*:functions' ignored-patterns '_*' # no missing completions
# }}}
# Bindkeys {{{
bindkey "^A" beginning-of-line   # Like in bash, for memory
bindkey "^B" beginning-of-line   # This won't be screwed up by screen, but weird
bindkey "^E" end-of-line         # Like in bash
bindkey "^N" accept-and-infer-next-history # Enter; pop next history event
bindkey "^O" push-line           # Pushes line to buffer stack
bindkey "^P" get-line            # Pops top of buffer stack
bindkey "^R" history-incremental-search-backward # Like in bash, but should !
bindkey "^T" transpose-chars     # Transposes adjacent chars
bindkey "^Y" copy-earlier-word
bindkey "^Z" accept-and-hold     # Enter and push line
bindkey " " magic-space          # Expands from hist (!vim )
bindkey "^\\" pound-insert       # As an alternative to ctrl-c; will go in hist
bindkey "\e[3~" delete-char      # Enable delete
#bindkey "^Q" predict-off        # Disable sweet complete-as-you-type
#bindkey "..." predict-on         # Enable sweet complete-as-you-type

# }}}
# Aliases {{{
# Misc {{{
alias cp='nocorrect cp'        # Don't correct this cmd
alias mkdir='nocorrect mkdir'  # Don't correct this cmd
alias mv='nocorrect mv'        # Don't correct this cmd
alias touch='nocorrect touch'  # Don't correct this cmd
alias git='nocorrect git'
alias slurp='wget -r --no-parent'
# }}}
# Shortcuts {{{
alias 'k'='$HOME/r/utils/cmdline/bin/knewton_ssh_helper.py'
alias 'b'='cd ..'               # cd .. takes too much effort!
alias 'bb'='cd ../..'
alias 'bbb'='cd ../../..'
alias 'bbbb'='cd ../../../..'
alias 'bbbbb'='cd ../../../../..'
alias 'bbbbbb'='cd ../../../../../..'
alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'
alias l='ls'
alias ll='ls -l'
alias la='ls -la'
alias reload='source ~/.zshrc'   # re-sources this
alias usage='du -hs *'           # nicely displays disk usage of items in pwd
which htop>/dev/null && alias top='htop' # prettier version of top if it exists
alias idea=/opt/idea-IC/bin/idea.sh
# }}}
# Global shortcuts {{{
alias -g G='|egrep'              # cat biglongfile G cheese
alias -g H='|head'               # cat biglongfile H
alias -g L='|less'               # cat biglongfile L
alias -g T='|tail'               # cat biglongfile T
alias -g W='|wc'                 # cat biglongfile W
# }}}
# }}}
# }}}
# Prompt {{{
source ~/.zshprompt
# }}}
