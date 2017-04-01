all: clean_all data_all doc test paper readme

#CLEANING
#remove any intermediate files
clean:
	rm -f README.md

#TESTS
test:

#Project README
readme: README.Rmd
	R -e "rmarkdown::render('$(<F)')"

#OUTPUT
#Generate the paper
paper: research_plan.Rmd library.bib chicago-author-date.csl
	R -e "rmarkdown::render('$(<F)', 'all')"

