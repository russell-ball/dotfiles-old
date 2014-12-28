if ! which rails &> /dev/null; then
  return
fi

alias rdm='bundle exec rake db:migrate'
alias rdr='bundle exec rake db:rollback'
alias ram='bundle exec rake apartment:migrate'
alias rgm='bundle exec rails generate migration'
