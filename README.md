# TeaCode Expand

An elisp package for expanding text in [TeaCode](https://www.apptorium.com/teacode) for macOS. Still a work in progress, but it is working on my system. 

TeaCode is a text expander designed for programmers. It expands the text based on the programming language of the file used. It is very flexible and can be scripted as well.

TeaCode requires the extension of the file to figure out the language for performing expansions. Therefore, if a buffer isn't attached to a file, it will tell TeaCode to use "any language". I'm trying to figure out how to make this user configurable so that the user to default to, say, markdown.

