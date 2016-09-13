```
# Execute preconditions script to ensure git is installed
curl -L https://raw.github.com/nurous/machine_config/master/preconditions-mac.sh | bash

# Execute fetch script to pull down the repo
curl -L https://raw.github.com/nurous/machine_config/master/fetch.sh | bash

# Use cloned repo to complete setup
cd ~/work/projects/own/machine_config/
./setup.sh				# Copy dotfiles into place
./installers.sh			# Install applications
./adjust-config.sh		# Change Mac OS settings
```
