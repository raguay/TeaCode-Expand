[![MELPA](https://melpa.org/packages/teacode-expand-badge.svg)](https://melpa.org/#/teacode-expand)


# TeaCode Expand

An elisp package for expanding text in [TeaCode](https://www.apptorium.com/teacode) for macOS. It has been working great for me. But, if you find and issue, please submit a [issue](https://github.com/raguay/TeaCode-Expand/issues).

TeaCode is a text expander designed for programmers. It expands the text based on the programming language of the file used. It is very flexible and can be scripted as well.

TeaCode requires the extension of the file to figure out the language for performing expansions. Therefore, if a buffer isn't attached to a file, it will tell TeaCode to use "any language". I'm trying to figure out how to make this user configurable so that the user to default to, say, markdown.

## User Configurable Variables:

The following are variables that can be set by the user to change functionality. For this package, you can change:

### teacode-default-language

This variable defaults to `any language` and is set to the extension for a buffer that isn't attached to a file. Therefore, if you usually use buffers for quick JavaScript code, you could set the variable to `.js`.

## Adding to [DoomEmacs](https://github.com/hlissner/doom-emacs)

In the `~/.doom.d/packages.el` file, add this line:

```elisp
(package! teacode-expand :recipe (:host github
                                 :repo "raguay/TeaCode-Expand"
                                 :files ("tokens" "teacode-expand.el")))
```

In the `~/.doom.d/config.el` file, add this line:

```elisp
(global-set-key (kbd "C-A-e") 'teacode-expand)
```

Go to the `~/.emacs.d` folder and run `make`. The new package will be downloaded and installed. When you rerun Emacs, you will be able to expand lines of code using the `Ctrl-Alt-e` key combination. You can also run the command `teacode-expand` command directly.

If you want to change the default value of a package variable, you should do it in the `config.el` file in the `~/.doom.d` directory.

## Adding to [Spacemacs](http://spacemacs.org/) - Thanks to [Jan Dammshäuser](https://github.com/jandamm) for this information

Type `SPC f e d` in Spacemacs or open your configuration: `~/.spacemacs` or `~/.spacemacs.d/init.el`
Add `teacode-expand` to `dotspacemacs-additional-packages`

```elisp
dotspacemacs-additional-packages
'(
  teacode-expand
 )
```

Then set the shortcut to your likings in `dotspacemacs/user-config`.
This Example uses `Control + Alt + e`

For `vim` mode:
```elisp
  (define-key evil-insert-state-map (kbd "C-M-e") 'teacode-expand)
```

For `hybrid` mode:
```elisp
  (define-key evil-hybrid-state-map (kbd "C-M-e") 'teacode-expand)
```

For `emacs` mode:
```elisp
  (define-key evil-emacs-state-map (kbd "C-M-e") 'teacode-expand)
```

To enable TeaCode only for specific file types you could `add-hook` for the `major mode` and enable the shortcut there.
Another way would be to create a `teacode-mode` and add it to the `major modes`.
