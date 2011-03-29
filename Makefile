GUIDES = $(notdir $(wildcard guide/*.md))
HTML_GUIDES = $(addprefix public/,$(GUIDES:.md=.html))
PANDOC_DEFAULT_OPTIONS = \
		-5 \
		-c css/screen.css \
		-B template/header.html \
		-A template/footer.html
PANDOC_GUIDE_OPTIONS = \
		-B template/navigation.html \
		--toc

html: $(HTML_GUIDES)

public/index.html : guide/index.md
	pandoc \
		$(PANDOC_DEFAULT_OPTIONS) \
		$< \
		-o $@

public/%.html : guide/%.md
	pandoc \
		$(PANDOC_DEFAULT_OPTIONS) \
		$(PANDOC_GUIDE_OPTIONS) \
		$< \
		-o $@

clean:
	rm -vf public/*.html
