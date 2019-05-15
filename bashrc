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
function lupus-localdev-update {
(
  set -ex
  cd ~/.lupus-localdev
  if ! git status --porcelain; then
    echo "Error: Your lupus-localdev checkout in ~/.lupus-localdev contains changes. Clean the checkout before proceeding."
    exit 1
  fi
  git pull
  docker-compose up -d --build
)
}
