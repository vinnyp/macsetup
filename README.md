# Mac Setup
Mac setup for basic dev tools using brew. 

## /usr/local
The first thing we want to do is make sure that you own /usr/local/ and everything under it, so you don't need `sudo` rights to install anything. 


** Create it **
 
Check to see if you have a `/usr/local` directory. If /usr/local doesn't exist, let's create it.

```
$ sudo mkdir /usr/local
```

** Take ownership **

Set ownership to you so you can rw without sudo. 

```
$ sudo chown -R $USER:admin /usr/local
```

## Homebrew

** Install Homebrew **

Skip this step if you already have [homebrew](http://brew.sh/) installed.

To install homebrew, run the command below in your terminal. It **should not** ask you for `sudo`. If it does, check the help documentation. Changing the ownership and group over should have removed this need. 

```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

** Update homebrew **

Before we install any packages, let's update Homebrew.

```
$ brew doctor
$ brew update
$ brew doctor
```

## Node & NPM
The instructions outlined below come from [this gist](https://gist.github.com/DanHerbert/9520689).

#### If node & npm aren't already installed

```
$ brew install node --without-npm
$ echo prefix=~/.node >> ~/.npmrc
$ curl -L https://www.npmjs.com/install.sh | sh
``` 


#### If node & npm are already installed

The goal is to remove the dependency on `sudo`. We'll need to list out what packages you already have globally so we can reinstall them. 

** 1. Find what global packages you have **

```
$ cd /usr/local/lib/node_modules
$ ls -la
```
Write all of these down so can reinstall them. 


** 2. Remove all existing node and NPM directories. **

```
$ rm -rf ~/.npm
$ rm -rf ~/.node
$ rm -rf ~/.cache
$ rm -rf ~/node_modules
$ rm -rf /usr/local/lib/node_modules
```

** 3. Uninstall, then reinstall node & NPM **

```
$ brew uninstall node
$ brew install node --without-npm
$ echo prefix=~/.node >> ~/.npmrc
$ curl -L https://www.npmjs.com/install.sh | sh
```

** 4. Reinstall your global packages **

```
$ npm install -g <package> <package> <package> etc.
```

## Update your PATH and NODE_PATH
Now we'll update your `PATH` to include the directories you need

** Edit your ~/.bash_profile **
Look for your `PATH` statement, and make sure it includes the following paths:

```
export PATH="$PATH:/usr/local:/usr/local/bin:/usr/local/sbin"
export PATH="$HOME/.node/bin:$PATH"
export NODE_PATH="/usr/local/lib/node_modules:${NODE_PATH}"
```

Now restart your terminal.