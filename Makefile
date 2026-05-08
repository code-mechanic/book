include docker/targets_docker.mk

pandoc_help:
	$(DOCKER) pandoc --help
	$(DOCKER) pandoc --version

book_c_programming:
	$(DOCKER) pandoc \
	c_programming/chapters/chapter1.md \
	c_programming/chapters/chapter2.md \
	-d book.yaml \
	--pdf-engine=xelatex \
	-o c_programming_book.pdf

clean:
	rm -f c_programming_book.pdf