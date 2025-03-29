.PHONY: all images docs
all: images docs
docs: main-copied.pdf

images-from-svg := $(patsubst %.svg,%.png,$(wildcard images-svg/*.svg))
images: $(images-from-svg)

# latexmk -lualatex -lualatex='lualatex --shell-escape %O %S' $<
#latexmk -lualatex -lualatex='lualatex --shell-escape %O %S' $<
%.pdf: %.tex images Makefile
	shell_escape_commands=$(kpsewhich -expand-var '$shell_escape_commands'),'"lilypond"','"gs"' latexmk -lualatex $<

%-copied.pdf: %.pdf
	mv $< $@

%.png: %.svg Makefile
	inkscape $< --without-gui --export-filename $@ --export-dpi=300 --export-area-drawing
