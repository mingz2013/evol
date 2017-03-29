BASEDIR=$(CURDIR)
OUTPUTDIR=$(BASEDIR)/output
GITHUB_PAGES_BRANCH=gh-pages

help:
	@echo 'Makefile for a pelican Web site                                           '
	@echo '                                                                          '
	@echo 'Usage:                                                                    '
	@echo '   make clean                          remove the generated files         '
	@echo '   make publish                        generate using production settings '
	@echo '   make github                         upload the web site via gh-pages   '
	@echo '                                                                          '
	@echo 'Set the DEBUG variable to 1 to enable debugging, e.g. make DEBUG=1 html   '
	@echo 'Set the RELATIVE variable to 1 to enable relative urls                    '
	@echo '                                                                          '

clean:
	# [ ! -d $(OUTPUTDIR) ] || rm -rf $(OUTPUTDIR)
	rm -rf $(OUTPUTDIR)/*

publish:
	cp index.html $(OUTPUTDIR)

github: publish
	ghp-import -m "make github" -b $(GITHUB_PAGES_BRANCH) $(OUTPUTDIR) -p
	git add .; git commit -m "update web site"; git push origin master

.PHONY: help clean publish github
