themedir           = $(datadir)/themes
platanodir         = $(DESTDIR)$(themedir)/Platano
luminedir          = $(DESTDIR)$(themedir)/Platano-Light
noirdir            = $(DESTDIR)$(themedir)/Platano-Dark
platanocompactdir  = $(DESTDIR)$(themedir)/Platano-Compact
luminecompactdir   = $(DESTDIR)$(themedir)/Platano-Light-Compact
noircompactdir     = $(DESTDIR)$(themedir)/Platano-Dark-Compact

index_file               = $(srcdir)/index.theme
index_light_file         = $(srcdir)/index.theme-light
index_dark_file          = $(srcdir)/index.theme-dark
index_compact_file       = $(srcdir)/index.theme-compact
index_light_compact_file = $(srcdir)/index.theme-light-compact
index_dark_compact_file  = $(srcdir)/index.theme-dark-compact

# ******************
# * Generate files *
# ******************

all:

# *****************
# * Install files *
# *****************

install-data-local:
	cp -Rv $(index_file) $(platanodir)/index.theme
	cp -Rv $(index_light_file) $(luminedir)/index.theme
	cp -Rv $(index_dark_file) $(noirdir)/index.theme
	cp -Rv $(index_compact_file) $(platanocompactdir)/index.theme
	cp -Rv $(index_light_compact_file) $(luminecompactdir)/index.theme
	cp -Rv $(index_dark_compact_file) $(noircompactdir)/index.theme

# *******************
# * Uninstall files *
# *******************

uninstall-local:
	test -e $(noirdir)/index.theme && rm -rfv $(noirdir)/index.theme
	test -e $(luminedir)/index.theme && rm -rfv $(luminedir)/index.theme
	test -e $(platanodir)/index.theme && rm -rfv $(platanodir)/index.theme
	test -e $(noircompactdir)/index.theme && rm -rfv $(noircompactdir)/index.theme
	test -e $(luminecompactdir)/index.theme && rm -rfv $(luminecompactdir)/index.theme
	test -e $(platanocompactdir)/index.theme && rm -rfv $(platanocompactdir)/index.theme

# ****************************
# * Clean up generated files *
# ****************************

CLEANFILES =

DISTCLEANFILES = \
	$(CLEANFILES)
