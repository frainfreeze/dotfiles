### aliases ###
#git
alias gst='git status'
alias gpl='git pull'
alias gps='git push'
alias gaa='git add --all'
alias gca='git commit -a'



### functions ###
#type listening 8080 to find out what process is blocking that port
listening() {
    lsof -n -iTCP:$1 | grep LISTEN
}
