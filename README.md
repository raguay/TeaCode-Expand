[![MELPA](https://melpa.org/packages/teacode-expand-badge.svg)](https://melpa.org/#/teacode-expand)


# TeaCode Expand

An elisp package for expanding text in [TeaCode](https://www.apptorium.com/teacode) for macOS. Still a work in progress, but it is working on my system. 

TeaCode is a text expander designed for programmers. It expands the text based on the programming language of the file used. It is very flexible and can be scripted as well.

TeaCode requires the extension of the file to figure out the language for performing expansions. Therefore, if a buffer isn't attached to a file, it will tell TeaCode to use "any language". I'm trying to figure out how to make this user configurable so that the user to default to, say, markdown.

## User Configurable Variables:

The following are variables that can be set by the user to change functionality. For this package, you can change:

###teacode-default-language

This variable defaults to `any language` and is set to the extension for a buffer that isn't attached to a file. Therefore, if you usually use buffers for quick JavaScript code, you could set the variable to `.js`.

## Adding to [DoomEmacs](https://github.com/hlissner/doom-emacs)

In the `~/.doom.d/packages.el` file, add this line:

```elisp
(package! teacode-expand :recipe (:fetcher github
                                 :repo "raguay/TeaCode-Expand"
                                 :files ("tokens" "teacode-expand.el")))
```

In the `~/.doom.d/config.el` file, add this line:

```elisp
(global-set-key (kbd "C-A-e") 'teacode-expand)
```

Go to the `~/.emacs.d` folder and run `make`. The new package will be downloaded and installed. When you rerun Emacs, you will be able to expand lines of code using the `Ctrl-Alt-e` key combination. You can also run the command `teacode-expand` command directly.

If you want to change the default value of a package variable, you should do it in the `config.el` file in the `~/.doom.d` directory.

## Adding to [Spacemac](http://spacemacs.org/)

Coming soon...
