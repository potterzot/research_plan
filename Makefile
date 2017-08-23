all: clean readme plan ideas statement

#CLEANING
clean:
	rm -f README.md
	rm -f *.pdf *.html

#OUTPUT
%.pdf: %.Rmd library.bib chicago-author-date.csl style.css
	R -e "rmarkdown::render('$(<F)', 'pdf_document')"

%.html: %.Rmd library.bib chicago-author-date.csl style.css
	R -e "rmarkdown::render('$(<F)', 'html_document')"

%.md: %.Rmd library.bib chicago-author-date.csl style.css
	R -e "rmarkdown::render('$(<F)', 'md_document')"

#Generate the paper
readme: README.md
plan: research_plan.pdf research_plan.html
ideas: ideas.pdf 
statement: research_statement.pdf research_statement.html
