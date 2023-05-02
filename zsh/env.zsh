#!/bin/zsh

export PATH="$PATH:./node_modules/.bin"
export EDITOR="nvim"

# Make sure gpg is able to sign commits.
# See https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key.
export GPG_TTY=$(tty)
