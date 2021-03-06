ASSETS_DIR=assets
TARGETS=slides_presentation.pdf

all: $(TARGETS)

ASSETS=$(ASSETS_DIR)


slides_presentation.pdf: slides_presentation.md $(ASSETS)
	pandoc  $< -t beamer -s  -o $@



%.png: %.svg
	convert $< $@

clean: 
	rm -rf  $(TARGETS) *~

