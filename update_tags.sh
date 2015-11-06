#!/bin/sh
git tag -d flatdog && \
	git push origin :refs/tags/flatdog && \
	git push autobuild :refs/tags/flatdog && \
	git tag flatdog && \
	git push origin && \
	git push autobuild
