# Vim configuration file

My vim settings, based on laracast's "Vim Mastery" series.
It relies on the [coc extension](https://github.com/neoclide/coc.nvim), which relies
on the following

- The latest version of Node
- Either neovim >= 0.3.1 or vim >= 8
- The latest version of [nodejs](https://nodejs.org/en/)

Depending on the OS, the last one could require additional configuration, since
you will need the nightly versions of neovim if installing in linux. For a
quick guide on installing it on debian based system, use the following commands:

```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```

To install the python modules, run the following command

```bash
sudo apt-get install python3-dev python3-pip python3-neovim
```

## Installation

First, clone the repository inside the `~/Development/configuration` directory:

```bash
git clone git@github.com:ericdsw/vim-settings.git ~/Development/configuration/vim-settings
```

Note: there should exist a `~/.config` folder in your user directory so that the
script can correctly configure neovim's initial install script.

Then just run the provided install script:

```bash
./install.sh
```

The command should have created the following files and directories:

```bash
~/.vimrc
~/.gvimrc
~/.vim/
~/.config/nvim
```

Plugins are managed by Plug, which will be automatically installed if it's not
already present.
