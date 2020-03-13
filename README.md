# vim-settings
My vim settings, based on laracast's "Vim Mastery" series

## Pre-requisites
You will need Python3 installed in your system for the YCM plugin, as well as the following dependencies based on the OS:

#### MacOS
Install `cmake` and either `macvim` or `neovim` (or both) via `brew`.

#### Ubuntu
As per the official YCM documentation, the following command to install all required dependencies:
```
sudo apt install build-essentials cmake python3-dev
```

#### Windows
Just use the same installation instructions as Ubuntu inside WSL.

## Installation

First, clone the repository inside the `~/Development/configuration` directory:
```
git clone git@github.com:ericdsw/vim-settings.git ~/Development/configuration/vim-settings
```

Then just run the provided install script:
```
./install.sh
```

Plugins are managed by Plug, which will be automatically installed if it's not already present.
