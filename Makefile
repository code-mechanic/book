include docker/targets_docker.mk

C_PROGRAMMING_CHAPTERS := $(wildcard c_programming/chapters/*.md)
PANDOC_CONFIG := pandoc/c_programming.yaml
CODE_LINE_NUMBER_SIZE ?= scriptsize

environment_details:
	$(DOCKER) pandoc --help
	$(DOCKER) pandoc --version
	$(DOCKER) node --version
	$(DOCKER) npm --version

book_c_programming:
	$(DOCKER) pandoc \
	$(C_PROGRAMMING_CHAPTERS) \
	--defaults=$(PANDOC_CONFIG) \
	-V header-includes='\newcommand{\CodeLineNumberSize}{\$(CODE_LINE_NUMBER_SIZE)}' \
	-o c_programming_book.pdf

clean:
	rm -f c_programming_book.pdf
