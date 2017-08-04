all: clean readme paper

#CLEANING
#remove any intermediate files
clean:
	rm -f README.md
	rm -f research_plan.pdf research_plan.html

#Project README
readme: README.Rmd
	R -e "rmarkdown::render('$(<F)')"

#OUTPUT
#Generate the paper
paper: research_plan.Rmd library.bib chicago-author-date.csl
	R -e "rmarkdown::render('$(<F)', 'md_document')"
	R -e "rmarkdown::render('$(<F)', 'pdf_document')"
	R -e "rmarkdown::render('$(<F)', 'html_document')"

ideas: ideas.Rmd
	R -e "rmarkdown::render('$(<F)', 'md_document')"
