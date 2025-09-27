BUNDLER = /usr/bin/env bundler

.PHONY: site
site:
	cd _forest; git pull; git submodule update
	git add _forest
	$(MAKE) -C _forest
	mv forest/forest/* forest/
	rm -r forest/forest
	$(BUNDLER) exec jekyll build --lsi --trace
.PHONY: export
export:
	darcs convert export | perl -pe 's#refs/heads/trunk#refs/heads/trunk#g' | (cd ../hejohns.github.io_git-mirror/ && git fast-import)
.PHONY: push
push: export
	cd ../hejohns.github.io_git-mirror/ && git push
