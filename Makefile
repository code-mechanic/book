include docker/targets_docker.mk

C_PROGRAMMING_CHAPTERS := $(wildcard c_programming/chapters/*.md)
C_PROGRAMMING_CONFIG := pandoc/c_programming.yaml
C_PROGRAMMING_HTML_CONFIG := pandoc/c_programming_html.yaml
RTOS_CHAPTERS := $(wildcard rtos/chapters/*.md)
RTOS_CONFIG := pandoc/rtos.yaml
CODE_LINE_NUMBER_SIZE ?= scriptsize

environment_details:
	$(DOCKER) pandoc --help
	$(DOCKER) pandoc --version
	$(DOCKER) node --version
	$(DOCKER) npm --version

book_c_programming:
	$(DOCKER) pandoc \
	$(C_PROGRAMMING_CHAPTERS) \
	--defaults=$(C_PROGRAMMING_CONFIG) \
	-V header-includes='\newcommand{\CodeLineNumberSize}{\$(CODE_LINE_NUMBER_SIZE)}' \
	-o c_programming_book.pdf
	$(DOCKER) pandoc \
	$(C_PROGRAMMING_CHAPTERS) \
	--defaults=$(C_PROGRAMMING_HTML_CONFIG) \
	-o c_programming_book.html

book_rtos:
	$(DOCKER) pandoc \
	$(RTOS_CHAPTERS) \
	--defaults=$(RTOS_CONFIG) \
	-V header-includes='\newcommand{\CodeLineNumberSize}{\$(CODE_LINE_NUMBER_SIZE)}' \
	-o rtos_book.pdf

clean:
	rm -f c_programming_book.pdf c_programming_book.html rtos_book.pdf
