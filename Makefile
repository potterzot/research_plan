all: clean readme plan ideas statement advice diagram

#CLEANING
clean:
	rm -f *.pdf *.html *.md

#OUTPUT
%.pdf: %.Rmd library.bib chicago-author-date.csl style.css
	R -e "rmarkdown::render('$(<F)', 'pdf_document')"

%.html: %.Rmd library.bib chicago-author-date.csl style.css
	R -e "rmarkdown::render('$(<F)', 'html_document')"

%.md: %.Rmd library.bib chicago-author-date.csl style.css
	R -e "rmarkdown::render('$(<F)', 'md_document')"

#Generate the paper
readme: README.md
plan: research_plan.pdf research_plan.md
ideas: ideas.pdf ideas.md 
advice: advice.pdf advice.md 
statement: research_statement.pdf research_statement.md
diagram: diagram.html 
