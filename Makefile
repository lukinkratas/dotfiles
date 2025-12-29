.PHONY: link install

help:
	@echo "Available targets:"
	@echo "  link     - make symbolic links in home folder"
	@echo "  install  - install packages"
	@echo "  help     - Show this help message"

link:
	bash scripts/link.sh

install:
	brew install fzf bat

