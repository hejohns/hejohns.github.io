site:
	bundler exec jekyll build --lsi --trace
export:
	darcs convert export | perl -pe 's#refs/heads/trunk#refs/heads/trunk#g' | (cd ../hejohns.github.io_git-mirror/ && git fast-import)
push: export
	cd ../hejohns.github.io_git-mirror/ && git push
.PHONY: export push

