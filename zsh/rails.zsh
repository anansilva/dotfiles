# Aliases
alias rgm="be rails g migration"
alias rdbm="be rails db:migrate"
alias rrg="be rails routes | grep"

alias runningb="lsof -wni tcp:3001"
alias runningt="lsof -wni tcp:3000"

# Functions
bplease() {
kill -9 $(lsof -i tcp:3001 | grep ruby | awk '{print $2}')
./bin/spring rails s -p 3001 }

tplease() {
kill -9 $(lsof -i tcp:3000 | grep ruby | awk '{print $2}')
./bin/spring rails s -p 3000 }

byarn() {
 bundle && yarn
}

