.PHONY: link install

help:
	@echo "Available targets:"
	@echo "  link     - make symbolic links in home folder"
	@echo "  install  - install packages"
	@echo "  help     - Show this help message"

link:
	bash scripts/link.sh

install:
	brew tap databricks/tap
	brew install fzf bat yazi databricks starship zsh-autosuggestions zsh-syntax-highlighting
	brew install --cask ghostty
