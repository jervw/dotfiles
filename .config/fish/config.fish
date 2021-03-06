if status is-interactive
    # Commands to run in interactive sessions can go here
end

 function fish_right_prompt
  #intentionally left blank
 end
 
 function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

thefuck --alias | source


function twitch
    kill -9 $(ps -o ppid -p $fish_pid)
    nohup streamlink -p mpv --quiet --twitch-low-latency twitch.tv/"$argv" best &
    nohup chatterino -c "$argv" &> /dev/null 
end

# aliases
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias snapshot='sudo /usr/bin/timeshift --create --comments "alias" --tags D'
alias vim="nvim"
alias nano="nvim"
alias cat="bat"

# Bun
set -Ux BUN_INSTALL "/home/jervw/.bun"
set -px --path PATH "/home/jervw/.bun/bin"

