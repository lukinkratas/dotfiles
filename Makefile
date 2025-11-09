.PHONY: link

help:
	@echo "Available targets:"
	@echo "  link - make symbolic links in home folder"
	@echo "  help - Show this help message"

link:
	bash scripts/link.sh