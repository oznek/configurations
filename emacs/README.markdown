Emacs configuration files
=========================

How to use
----------

First, create backup copies of:

  * ~/.emacs
  * ~/.emacs.d

To use these files, just create a symbolic link
for the following files:

  * .emacs.d
  * .emacs-global

Using:

>     ln -s [PATH]/.emacs.d ~/.emacs.d
>
>     ln -s [PATH]/.emacs-global ~/.emacs-global

And create a copy of:

  * .emacs

to your home directory.
