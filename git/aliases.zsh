
alias gl="log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

alias gd='git icdiff'

alias gc='git commit -av'
alias gs='git status -sb'
alias ga='git add -A'

# I've also patched /usr/local/bin/icdiff with these default colors.
# color_codes = {
#     "black":   '\033[0;30m',
#     "red":     '\033[0;31m',
#     "green":   '\033[0;32m',
#     "yellow":  '\033[0;33m',
#     "blue":    '\033[0;34m',
#     "magenta": '\033[0;35m',
#     "cyan":    '\033[0;36m',
#     "white":   '\033[0;37m',
#     "none":    '\033[m',
#     "black_bold":   '\033[1;30m',
#     "red_bold":     '\033[1;31m',
#     "green_bold":   '\033[1;32m',
#     "yellow_bold":  '\033[1;33m',
#     "blue_bold":    '\033[1;34m',
#     "magenta_bold": '\033[1;35m',
#     "cyan_bold":    '\033[1;36m',
#     "white_bold":   '\033[1;37m',
#     "green_light":  '\033[38;5;34m',
#     "red_light":    '\033[38;5;196m',
#     "yellow_light":  '\033[38;5;172m',
# }
#
#
# color_mapping = {
#     "add": "green_light",
#     "subtract": "red_light",
#     "change": "yellow_light",
#     "separator": "blue",
#     "description": "blue",
#     "meta": "magenta",
#     "line-numbers": "white",
# }
