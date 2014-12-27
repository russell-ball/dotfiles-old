if ! which cap &> /dev/null; then
  return
fi

# Capistrano
alias csd='cap staging deploy'
alias csdm='cap staging deploy:migrations'
alias cpd='cap production deploy'
alias cpdm='cap production deploy:migrations'
