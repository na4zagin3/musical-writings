#! /usr/bin/env nix-shell
#! nix-shell -i bash

latexmk_lualatex () {
    shell_escape_commands=$(kpsewhich -expand-var '$shell_escape_commands'),'"lilypond"','"gs"' latexmk -lualatex "$@"
}

make --trace
latexmk_lualatex main.tex
