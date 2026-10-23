include docker/targets_docker.mk

C_PROGRAMMING_CHAPTERS := $(wildcard book_c_program/chapters/*.md)
C_PROGRAMMING_CONFIG := pandoc/c_programming.yaml
C_PROGRAMMING_HTML_CONFIG := pandoc/c_programming_html.yaml
C_PROGRAM_NOTES_CHAPTERS := $(wildcard book_c_program_notes/*.md)
C_PROGRAM_NOTES_CONFIG := pandoc/c_program_notes.yaml
C_PROGRAM_NOTES_HTML_CONFIG := pandoc/c_program_notes_html.yaml
RTOS_CHAPTERS := $(wildcard book_rtos/chapters/*.md)
RTOS_CONFIG := pandoc/rtos.yaml
INTERVIEW_QUESTIONS_CHAPTERS := $(wildcard book_interview_questions/*.md)
INTERVIEW_QUESTIONS_CONFIG := pandoc/interview_questions.yaml
INTERVIEW_QUESTIONS_HTML_CONFIG := pandoc/interview_questions_html.yaml
GIT_CHAPTERS := $(wildcard book_git/*.md)
GIT_CONFIG := pandoc/git.yaml
GIT_HTML_CONFIG := pandoc/git_html.yaml
EMBEDDED_C_CHAPTERS := $(wildcard book_embedded_c/*.md)
EMBEDDED_C_CONFIG := pandoc/embedded_c.yaml
EMBEDDED_C_HTML_CONFIG := pandoc/embedded_c_html.yaml
CODE_LINE_NUMBER_SIZE ?= scriptsize

environment_details:
	$(DOCKER) pandoc --help
	$(DOCKER) pandoc --version
	$(DOCKER) node --version
	$(DOCKER) npm --version

book_c_program_notes:
	$(DOCKER) pandoc \
	$(C_PROGRAM_NOTES_CHAPTERS) \
	--defaults=$(C_PROGRAM_NOTES_CONFIG) \
	-V header-includes='\newcommand{\CodeLineNumberSize}{\$(CODE_LINE_NUMBER_SIZE)}' \
	-o c_program_notes_book.pdf
	$(DOCKER) pandoc \
	$(C_PROGRAM_NOTES_CHAPTERS) \
	--defaults=$(C_PROGRAM_NOTES_HTML_CONFIG) \
	-o c_program_notes_book.html

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

book_interview_questions:
	$(DOCKER) pandoc \
	$(INTERVIEW_QUESTIONS_CHAPTERS) \
	--defaults=$(INTERVIEW_QUESTIONS_CONFIG) \
	-V header-includes='\newcommand{\CodeLineNumberSize}{\$(CODE_LINE_NUMBER_SIZE)}' \
	-o interview_questions_book.pdf
	$(DOCKER) pandoc \
	$(INTERVIEW_QUESTIONS_CHAPTERS) \
	--defaults=$(INTERVIEW_QUESTIONS_HTML_CONFIG) \
	-o interview_questions_book.html

book_git:
	$(DOCKER) pandoc \
	$(GIT_CHAPTERS) \
	--defaults=$(GIT_CONFIG) \
	-V header-includes='\newcommand{\CodeLineNumberSize}{\$(CODE_LINE_NUMBER_SIZE)}' \
	-o git_book.pdf
	$(DOCKER) pandoc \
	$(GIT_CHAPTERS) \
	--defaults=$(GIT_HTML_CONFIG) \
	-o git_book.html

book_embedded_c:
	$(DOCKER) pandoc \
	$(EMBEDDED_C_CHAPTERS) \
	--defaults=$(EMBEDDED_C_CONFIG) \
	-V header-includes='\newcommand{\CodeLineNumberSize}{\$(CODE_LINE_NUMBER_SIZE)}' \
	-o embedded_c_book.pdf
	$(DOCKER) pandoc \
	$(EMBEDDED_C_CHAPTERS) \
	--defaults=$(EMBEDDED_C_HTML_CONFIG) \
	-o embedded_c_book.html

clean:
	rm -f c_program_notes_book.pdf c_program_notes_book.html c_programming_book.pdf c_programming_book.html rtos_book.pdf interview_questions_book.pdf interview_questions_book.html git_book.pdf git_book.html embedded_c_book.pdf embedded_c_book.html compressed_*.pdf

compress:
	@echo "Compressing PDFs using Ghostscript..."
	@for file in c_program_notes_book.pdf c_programming_book.pdf rtos_book.pdf interview_questions_book.pdf git_book.pdf embedded_c_book.pdf; do \
		if [ -f $$file ]; then \
			echo "Compressing $$file..."; \
			gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=compressed_$$file $$file; \
			SIZE_ORIG=$$(stat -c%s "$$file"); \
			SIZE_COMP=$$(stat -c%s "compressed_$$file"); \
			if [ $$SIZE_COMP -lt $$SIZE_ORIG ]; then \
				echo "Compression successful. Kept compressed version."; \
				mv compressed_$$file $$file; \
			else \
				echo "Compressed file is larger. Kept original."; \
				rm compressed_$$file; \
			fi \
		fi \
	done
	@echo "Compression complete."

.PHONY: environment_details book_c_program_notes book_c_programming book_rtos book_interview_questions book_git book_embedded_c clean compress
