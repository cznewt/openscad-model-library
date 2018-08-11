CWD=$(shell pwd)

help:
	@echo "Available actions:"
	@echo "  primitive_images        Generate PNG images for all primitives"
	@echo "  composite_images        Generate PNG images for all composite objects"
	@echo "  composite_models        Generate STL models for all composite objects"

all: primitive_images composite_images documentation

primitive_images:
	find ./primitive/ -name "*.scad" | while read file; do \
		test ! -f ./docs/source/img/primitive/$$(basename $$file | cut -d '.' -f 1).png && echo "Rendering $$(basename $$file) image ..." && \
		openscad -o ./docs/source/img/primitive/$$(basename $$file | cut -d '.' -f 1).png --imgsize=1200,1200 --projection=o $$file; \
		test -f ./docs/source/img/primitive/$$(basename $$file | cut -d '.' -f 1).png && echo "Skipping $$(basename $$file) image ..."; done

composite_images:
	find ./composite/ -name "*.scad" | while read file; do \
		test ! -f ./docs/source/img/composite/$$(basename $$file | cut -d '.' -f 1).png && echo "Rendering $$(basename $$file) image ..." && \
		openscad -o ./docs/source/img/composite/$$(basename $$file | cut -d '.' -f 1).png --imgsize=1200,1200 $$file; \
		test -f ./docs/source/img/composite/$$(basename $$file | cut -d '.' -f 1).png && echo "Skipping $$(basename $$file) image ..."; done

composite_models:
	find ./composite/ -name "*.scad" | while read file; do \
		echo "Rendering $$(basename $$file) model ..."; \
		mkdir -p './build'; \
		openscad -o ./build/$$(basename $$file | cut -d '.' -f 1).stl -D 'quality="production"' $$file; done

documentation:
	cd docs && make html && cd ..; done
