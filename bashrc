# File to be sourced in ~/.bashrc

alias dcp=docker-compose

##
# Run docker-compose in the localdev folder.
##
function localdev-dcp {
  # Run command in sub-shell so the working directory is not changed for the invoking shell.
  (cd ~/.lupus-localdev && docker-compose "$@")
}

##
# Provide a way to easily update the setup.
##
function localdev-update {
(
  set -ex
  cd ~/.lupus-localdev
  if ! git status --porcelain; then
    echo "Error: Your lupus-localdev checkout in ~/.lupus-localdev contains changes. Clean the checkout before proceeding."
    exit 1
  fi
  git pull
  docker-compose up -d --build
  bash
)
# Restart bash so any bashrc updates ares added in.
bash
}

### Default settings for devsetup-docker projects:

# Use a different HTTP port, so it won't collide with ours.
export WEB_HTTP_PORT=0
# Ensure the right user id is used.
export COMPOSE_DEFAULT_USER=$(id -u $USER)
