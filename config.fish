set -x PATH ~/android-ndk/ $PATH

function fish_right_prompt
date "+%Y/%m/%d %H:%M:%S"
end

#yoink='open -a Yoink'
function yoink
#open -a /Applications/Yoink.app $argv
open -a Yoink $argv
end

function fish_greeting
    echo "Gavin, Welcome to the macOS Fish world!"
end
