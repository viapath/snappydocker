#!/bin/sh
git tag -d flatdog && \
	git push origin :refs/tags/flatdog && \
	git push autobuild :refs/tags/flatdog && \
	git push origin && \
	git push autobuild && \
	git tag flatdog && \
	git push origin --tags && \
	git push autobuild --tags
