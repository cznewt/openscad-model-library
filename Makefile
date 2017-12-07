CWD=$(shell pwd)

help:
	@echo "Available actions:"
	@echo "  primitive_images        Generate PNG images for all primitives"
	@echo "  composite_images        Generate PNG images for all composite objects"
	@echo "  composite_models        Generate STL models for all composite objects"

primitive_images:
	find ./primitive/ -name "*.scad" | while read file; do \
		echo "Rendering $$(basename $$file) image ..."; \
		openscad -o ./docs/source/img/$$(basename $$file | cut -d '.' -f 1).png --imgsize=1200,1200 --projection=o --render --colorscheme=DeepOcean $$file; done

composite_images:
	find ./composite/ -name "*.scad" | while read file; do \
		echo "Rendering $$(basename $$file) image ..."; \
		openscad -o ./docs/source/img/$$(basename $$file | cut -d '.' -f 1).png --imgsize=1200,1200 --projection=o --render --colorscheme=DeepOcean $$file; done

composite_models:
	find ./composite/ -name "*.scad" | while read file; do \
		echo "Rendering $$(basename $$file) model ..."; \
		mkdir -p './build'; \
		openscad -o ./build/$$(basename $$file | cut -d '.' -f 1).stl -D 'quality="production"' $$file; done
