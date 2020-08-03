KEY=$HOME/.ssh/id_rsa
 
AGENT_RUNNING=`ps -ef | grep ssh-agent`
if [[ "$AGENT_RUNNING" == "" ]]; then
   echo "Removing stale SSH_AUTH_SOCK"
   rm -rf ~/.ssh/ssh_auth_sock
   # kill ssh-agent, works in git bash and linux
   ps -W | awk '/ssh-agent/,NF=1' | xargs kill -f
fi
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
   eval `ssh-agent`
   ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
   ssh-add $KEY
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add
export GIT_SSH=$(which ssh)

# Start SSH Agent
#----------------------------

SSH_ENV="$HOME/.ssh/environment"

function run_ssh_env {
  . "${SSH_ENV}" > /dev/null
}

function start_ssh_agent {
  echo "Initializing new SSH agent..."
  ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo "succeeded"
  chmod 600 "${SSH_ENV}"

  run_ssh_env;

  ssh-add ~/.ssh/id_rsa;
}

if [ -f "${SSH_ENV}" ]; then
  run_ssh_env;
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_ssh_agent;
  }
else
  start_ssh_agent;
fi