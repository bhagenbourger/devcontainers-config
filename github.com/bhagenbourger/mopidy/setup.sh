#!/bin/bash

##################################################
# Check for the presence of the Mopidy repository path argument
##################################################
if [ -z "$1" ] || [ ! -d "$1" ]; then
  echo "Usage: $0 <path-to-mopidy-repository>"
  exit 1
fi
MOPIDY_REPO_PATH="$1"
DEVCONTAINER_PATH="$(pwd)/github.com/bhagenbourger/mopidy/.devcontainer"

##################################################
# Setup git exclusion
##################################################
EXCLUDE_LINES=(
  ".devcontainer_config/**"
  ".devcontainer"
)
FILE="$MOPIDY_REPO_PATH/.git/info/exclude"

# Check if each line exists (quietly); if not, append it
for LINE_TO_ADD in "${EXCLUDE_LINES[@]}"; do
  grep -qxF "$LINE_TO_ADD" "$FILE" || echo "$LINE_TO_ADD" >> "$FILE"
done

##################################################
# Devcontainer symbolic links setup
##################################################
ln -sf $DEVCONTAINER_PATH $MOPIDY_REPO_PATH/.devcontainer

##################################################
# Copy the devcontainer configuration files
# This is necessary because the symbolic link to the .devcontainer directory will not work 
# inside the container due to how volumes are mounted.
##################################################
mkdir -p "$MOPIDY_REPO_PATH/.devcontainer_config/scripts"
mkdir -p "$MOPIDY_REPO_PATH/.devcontainer_config/mopidy"
cp "$DEVCONTAINER_PATH/scripts/post-create.sh" "$MOPIDY_REPO_PATH/.devcontainer_config/scripts/post-create.sh"
cp "$DEVCONTAINER_PATH/mopidy/mopidy.conf" "$MOPIDY_REPO_PATH/.devcontainer_config/mopidy/mopidy.conf"