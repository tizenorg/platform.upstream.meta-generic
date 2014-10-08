# ex: set tabstop=4 noexpandtab: 
VERSION = $(shell cat VERSION)
NAME=meta-generic
TAGVER = $(shell cat VERSION | sed -e "s/\([0-9\.]*\).*/\1/")
DESTDIR=
ARCH=i586

ifeq ($(VERSION), $(TAGVER))
        TAG = $(TAGVER)
else
        TAG = "HEAD"
endif

all:

install:
	install -d ${DESTDIR}/usr/share/package-groups/generic
	install -d ${DESTDIR}/usr/share/image-configurations/generic/scripts
	install -m 644 patterns/*.yaml ${DESTDIR}/usr/share/package-groups/generic
	install -D scripts/* ${DESTDIR}/usr/share/image-configurations/generic/scripts
	make -C src/generic-adaptation $@

test:
	merge-patterns -o output/ -p patterns -s

tag:
	git tag -a $(VERSION) -m "$(VERSION)"
	git push --tags

changelog:
	python ./scripts/gitlog2changelog.py


dist-bz2:
	git archive --format=tar --prefix=$(NAME)-$(VERSION)/ $(TAG) | \
		bzip2  > $(NAME)-$(VERSION).tar.bz2

dist-gz:
	git archive --format=tar --prefix=$(NAME)-$(VERSION)/ $(TAG) | \
		gzip  > $(NAME)-$(VERSION).tar.gz

dist: dist-bz2

clean:
	rm -rf patterns.xml INDEX.xml group.xml *.xml
