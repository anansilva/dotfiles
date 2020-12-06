# Alias
alias hrc="heroku run rails console"
alias hdb="heroku run rails db:migrate"

# Functions
gph() { git push heroku $(git branch | grep "*" | awk '{ print $2 }') }
