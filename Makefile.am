ACLOCAL_AMFLAGS = -I m4

themedir          = $(datadir)/themes
platanodir        = $(DESTDIR)$(themedir)/Platano
luminedir         = $(DESTDIR)$(themedir)/Platano-Light
noirdir           = $(DESTDIR)$(themedir)/Platano-Dark
platanocompactdir = $(DESTDIR)$(themedir)/Platano-Compact
luminecompactdir  = $(DESTDIR)$(themedir)/Platano-Light-Compact
noircompactdir    = $(DESTDIR)$(themedir)/Platano-Dark-Compact

SUBDIRS = \
	src/gtk \
	src/shell \
	src/wm \
	src/extra \
	data

EXTRA_DIST = \
	COPYING \
	LICENSE_CC_BY_SA4

install-data-hook:
	cp -Rv $(EXTRA_DIST) $(platanodir)

uninstall-hook:
	test -e $(noirdir) && rm -rfv $(noirdir)
	test -e $(luminedir) && rm -rfv $(luminedir)
	test -e $(platanodir) && rm -rfv $(platanodir)
	test -e $(noircompactdir) && rm -rfv $(noircompactdir)
	test -e $(luminecompactdir) && rm -rfv $(luminecompactdir)
	test -e $(platanocompactdir) && rm -rfv $(platanocompactdir)
