# General
alias vu='dotenv vagrant up'
alias nn="nvim ~/Dropbox/Notes/n360"


#API
alias dp='cd ~/src/provider-nexus-api'
alias gip='dp;LOG_LEVEL=DEBUG bin/import-project 00000001 | node_modules/.bin/bunyan'
alias gig='LOG_LEVEL=DEBUG bin/gulp-core import:s3global --force | node_modules/.bin/bunyan'
alias gw="dp; ENABLE_ACTIVITY_LOGGING=false LOG_LEVEL=DEBUG node_modules/.bin/gulp | node_modules/.bin/bunyan"
alias gt="dp; NODE_ENV=test LOG_LEVEL=FATAL node_modules/.bin/gulp test --silent -r nyan"
alias pgpnlc="pgcli postgres://provider_nexus:provider_nexus@localhost:25432/provider_nexus_core"
alias pgpnls="pgcli postgres://provider_nexus:provider_nexus@localhost:25432/provider_nexus_search"
alias pgpnltc="pgcli postgres://provider_nexus:provider_nexus@localhost:25432/provider_nexus_core_test"
alias pgpnlts="pgcli postgres://provider_nexus:provider_nexus@localhost:25432/provider_nexus_search_test"

#N360
alias ne="dn; nvim ."
alias rip='dn; time SKIP_QA=true SKIP_COMP_ACCESS=true DATABASE_POOL_SIZE=10 PROJECT_IMPORT_PARALLELISM=8 rake import:project'
alias rig='dn; rake import:global'
alias tl='dn;tail -n 100 -f log/development_caching.log'
alias dn='cd ~/src/network360'
alias sshnss="ssh rball@10.10.52.102"
alias sshnsr="ssh rball@10.10.51.120"
alias sshnpa="ssh rball@10.11.51.45"
alias sshnps="ssh rball@10.11.51.12"
alias sshnpr="ssh rball@10.11.51.254"
alias pgnl="pgcli postgres://developer:developer@localhost:15432/network360"
alias pgnsb="pgcli postgres://rball@10.10.11.203/network360"
alias pgnsw="pgcli postgres://rball@10.10.11.229/network360"
alias pgnsg="pgcli postgres://rball@10.10.11.232/network360"
alias pgnp="pgcli postgres://rball@10.11.11.151/network360"

#PDM
alias df="cd ~/src/pdm-contracts-api"
alias opdm="df;nvim ."
alias pdmn="nvim ~/Dropbox/Notes/pdm"
alias gi="rake global:import"
alias pi="time rake project:import"
alias fsi="time rake fee_schedule:import"
alias sshpdms="ssh rball@10.20.50.173"
alias sshpdmp="ssh rball@10.21.50.157"
alias pgsecs="pgcli -h pdm-security-staging-s180524-db.pdm-staging.internal -d security -U rball"
alias pgol="pgcli postgres://ops@localhost:5432/ops"
alias pgpdms="pgcli -h pdm-contracts-staging-s180608-pdm-contracts-rds-cluster.cluster-chduqozqf9iv.us-east-1.rds.amazonaws.com -U rball -d pdm-contracts"
alias pgpdmp="pgcli -h pdm-contracts-production-p180605-pdm-contracts-rds-cluster.cluster-chduqozqf9iv.us-east-1.rds.amazonaws.com -U rball -d pdm-contracts"

git config --global user.email "rball@strenuus.com"
git config --global user.name "Russell Ball"
