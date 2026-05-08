include docker/targets_docker.mk

book_c_programming:
	$(DOCKER) pandoc \
	c_programming/chapters/chapter1.md \
	c_programming/chapters/chapter2.md \
	--metadata-file=book.yaml \
	--pdf-engine=xelatex \
	--highlight-style=zenburn \
	-o c_programming_book.pdf

clean:
	rm -f c_programming_book.pdf