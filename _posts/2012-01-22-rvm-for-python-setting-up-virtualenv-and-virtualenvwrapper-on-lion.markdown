---
layout: post
title: "RVM for Python (setting up virtualenv &amp; virtualenvwrapper on Lion)"
date: 2012-01-22 00:16
comments: true
categories:
- RVM
- Python
- Best Practices
---

If you're a regular reader of my blog, you know that I use RVM (Ruby Version Manager) to manage gemsets on my computer.  This way, I can have an app running on Rails 3.0 and another on Rails 3.1 and don't have to worry about gem incompatibilities.  Without RVM, you are stuck with just one set of gems for your entire system, which makes working on more than one app a hassle or worse.  Naturally, this problem is not Ruby-specific, but affects every language that utilizes packages.

Python is one of them, and it's one you're likely to need to use at some point.  The Python community (specifically [these fine people](https://raw.github.com/pypa/virtualenv/master/AUTHORS.txt)) has developed a tool to manage your environments in Python in a very similar manner to how RVM makes our lives easier in Ruby.  It's called virtualenv.
<!-- more -->
On its own, virtualenv defaults to letting you place a 'virtual environment' within an arbitrary folder.  So each project folder could, for example, has its own virtual environment or two.  The experience of many Python users has been that this can get a bit disorganized and messy.  This is also a different approach than what us Ruby developers are used to with RVM, where all of the rubies and their gemsets are stored in a central location under *~/.rvm*.

Eventually, one Doug Hellman decided it would be easier to keep everything in a centralized location and wrote virtualenvwrapper, which helps you manage your virtual environments and switch between them quickly and easily.  Together these two tools are work very much like RVM and make the odd Rubyist feel a lot more comfortable dabbling in Python.  As a bonus, virtualenv will set up pip, (which is a lot like Ruby's bundler gem) in each environment, saving you the trouble of installing it manually.

Here's how to get this going in Mac OS X:

First you'll use easy_install (which is preinstalled in Lion and is a bit like the gem command) to grab virtualenv and virtualenvwrapper:

`sudo easy_install virtualenv`

`sudo easy_install virtualenvwrapper`

The second command will install virtualenvwrapper.sh into */usr/local/bin/*.  You need to update you .bashrc file to load that on startup.  You also need to specify a location to save all of the virtual environments.  Finally you need to tell pip that it should install to the active virtual environment and install to the virtual environments' directory.  Add these four lines to your .bashrc:

``` sh
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
```

Now switch to terminal and open a new tab or window.  You should see some output as virtualenvwrapper initializes the .virtualenvs folder.

To create a virtual environment, just do this, with whatever name you wish in place of 'myVirtualEnv':

`mkvirtualenv myVirtualEnv`

To see a list of all your virtual environments, just do this:

`workon`

To activate one, do this:

`workon myVirtualEnv`

You'll notice that when an environment is active your command prompt will change to reflect that status, e.g. `(myVirtualEnv)iMac:~ $`

Here's a blog post by Rich Leland with a screencast showing some more tricks you can do with virtualenvwrapper: [http://mathematism.com/2009/07/30/presentation-pip-and-virtualenv/](http://mathematism.com/2009/07/30/presentation-pip-and-virtualenv/)

And here is the documentation: [http://www.doughellmann.com/docs/virtualenvwrapper/](http://www.doughellmann.com/docs/virtualenvwrapper/)

In RVM, we have the ability to cause a specific gemset to load when opening a directory in terminal by saving a .rvmrc file in the project root with the gemset specified on a single line inside like this: `rvm use ruby-1.9.3-p0@my_gemset`

To achieve the same thing with virtualenvwrapper, just paste this into your .bashrc:

``` sh
has_virtualenv() {
    if [ -e .venv ]; then
        workon `cat .venv`
    fi
}
venv_cd () {
    cd "$@" && has_virtualenv
}
alias cd="venv_cd"
```

Then add a .venv file to the project root with the name of its environment, like `myVirtualEnv`

As you can see, this snippet just aliases the cd command and runs a function every time it's called that checks for a .venv file and then tries to call `workon [file contents]`.  Thanks to [Justin Lilly](https://github.com/justinlilly/) for coming up with it.

**Update 9/29/2012**
Virtual environment support is now built-in to Python beginning with version 3.3.  [More details here.](http://www.python.org/dev/peps/pep-0405/)