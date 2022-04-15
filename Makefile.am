ACLOCAL_AMFLAGS = -I m4

themedir          = $(datadir)/themes
platanodir        = $(DESTDIR)$(themedir)/Platano
luminedir         = $(DESTDIR)$(themedir)/Platano-Lumine
noirdir           = $(DESTDIR)$(themedir)/Platano-Noir
platanocompactdir = $(DESTDIR)$(themedir)/Platano-Compact
luminecompactdir  = $(DESTDIR)$(themedir)/Platano-Lumine-Compact
noircompactdir    = $(DESTDIR)$(themedir)/Platano-Noir-Compact

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
