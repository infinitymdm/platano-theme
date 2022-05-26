themedir         = $(datadir)/themes
platanodir         = $(DESTDIR)$(themedir)/Platano
luminedir        = $(DESTDIR)$(themedir)/Platano-Light
noirdir          = $(DESTDIR)$(themedir)/Platano-Dark
platanocompactdir  = $(DESTDIR)$(themedir)/Platano-Compact
luminecompactdir = $(DESTDIR)$(themedir)/Platano-Light-Compact
noircompactdir   = $(DESTDIR)$(themedir)/Platano-Dark-Compact

plankdir          = $(srcdir)/plank
plank_lumine_file = $(plankdir)/dock-light.theme
plank_noir_file   = $(plankdir)/dock-dark.theme

telegramdir          = $(srcdir)/telegram
telegram_file        = $(telegramdir)/platano.tdesktop-theme
telegram_lumine_file = $(telegramdir)/platano-lumine.tdesktop-theme
telegram_noir_file   = $(telegramdir)/platano-noir.tdesktop-theme

tweetdeckdir          = $(srcdir)/tweetdeck
tweetdeck_lumine_file = $(tweetdeckdir)/light/ColorDeck-light.cdk
tweetdeck_noir_file   = $(tweetdeckdir)/dark/ColorDeck-dark.cdk

airdir              = $(srcdir)/airforsteam
air_dark_color_file = $(airdir)/Resource/colors/platano-noir.styles
air_dark_theme_file = $(airdir)/Resource/themes/_platano-noir.styles

gtksourceviewdir   = $(srcdir)/gtksourceview
gtksourceview_noir_file = \
	$(gtksourceviewdir)/platano-dark.xml
gtksourceview_lumine_file = \
	$(gtksourceviewdir)/platano-light.xml

# ******************
# * Generate files *
# ******************

all:
if ENABLE_TWEETDECK
	cd $(tweetdeckdir) && ./recolor-cdk.sh
endif

if ENABLE_TELEGRAM
	cd $(telegramdir) && ./recolor-telegram.sh

	cd $(telegramdir)/mixed && $(ZIP) --strip-extra -o ../platano.tdesktop-theme \
		./colors.tdesktop-theme ./tiled.png
	cd $(telegramdir)/light && $(ZIP) --strip-extra -o ../platano-lumine.tdesktop-theme \
		./colors.tdesktop-theme ./tiled.png
	cd $(telegramdir)/dark && $(ZIP) --strip-extra -o ../platano-noir.tdesktop-theme \
		./colors.tdesktop-theme ./tiled.png
endif

if ENABLE_AIRFORSTEAM
	cd $(airdir) && ./recolor-air.sh
endif

	cd $(gtksourceviewdir) && ./recolor-gtksourceview.sh

# *****************
# * Install files *
# *****************

install-data-local:
if ENABLE_PLANK
	$(MKDIR_P) $(platanodir)/plank
	$(MKDIR_P) $(luminedir)/plank
	$(MKDIR_P) $(noirdir)/plank
	$(MKDIR_P) $(platanocompactdir)/plank
	$(MKDIR_P) $(luminecompactdir)/plank
	$(MKDIR_P) $(noircompactdir)/plank
	cp -Rv $(plank_noir_file) $(platanodir)/plank/dock.theme
	cp -Rv $(plank_lumine_file) $(luminedir)/plank/dock.theme
	cp -Rv $(plank_noir_file) $(noirdir)/plank/dock.theme
	cp -Rv $(plank_noir_file) $(platanocompactdir)/plank/dock.theme
	cp -Rv $(plank_lumine_file) $(luminecompactdir)/plank/dock.theme
	cp -Rv $(plank_noir_file) $(noircompactdir)/plank/dock.theme
endif

if ENABLE_TELEGRAM
	$(MKDIR_P) $(platanodir)/telegram
	$(MKDIR_P) $(luminedir)/telegram
	$(MKDIR_P) $(noirdir)/telegram
	cp -Rv $(telegram_file) $(platanodir)/telegram
	cp -Rv $(telegram_lumine_file) $(luminedir)/telegram
	cp -Rv $(telegram_noir_file) $(noirdir)/telegram
endif

if ENABLE_TWEETDECK
	$(MKDIR_P) $(platanodir)/tweetdeck
	$(MKDIR_P) $(luminedir)/tweetdeck
	$(MKDIR_P) $(noirdir)/tweetdeck
	cp -Rv $(tweetdeck_lumine_file) $(platanodir)/tweetdeck
	cp -Rv $(tweetdeck_lumine_file) $(luminedir)/tweetdeck
	cp -Rv $(tweetdeck_noir_file) $(noirdir)/tweetdeck
endif

if ENABLE_AIRFORSTEAM
	$(MKDIR_P) $(noirdir)/airforsteam/Resource/colors
	$(MKDIR_P) $(noirdir)/airforsteam/Resource/themes
	cp -Rv $(air_dark_color_file) $(noirdir)/airforsteam/Resource/colors
	cp -Rv $(air_dark_theme_file) $(noirdir)/airforsteam/Resource/themes
endif

	$(MKDIR_P) $(platanodir)/gtksourceview
	$(MKDIR_P) $(luminedir)/gtksourceview
	$(MKDIR_P) $(noirdir)/gtksourceview
	cp -Rv $(gtksourceview_noir_file) $(platanodir)/gtksourceview
	cp -Rv $(gtksourceview_lumine_file) $(luminedir)/gtksourceview
	cp -Rv $(gtksourceview_noir_file) $(noirdir)/gtksourceview

# *******************
# * Uninstall files *
# *******************

uninstall-local:
if ENABLE_PLANK
	test -e $(noirdir)/plank && rm -rfv $(noirdir)/plank
	test -e $(luminedir)/plank && rm -rfv $(luminedir)/plank
	test -e $(platanodir)/plank && rm -rfv $(platanodir)/plank
	test -e $(noircompactdir)/plank && rm -rfv $(noircompactdir)/plank
	test -e $(luminecompactdir)/plank && rm -rfv $(luminecompactdir)/plank
	test -e $(platanocompactdir)/plank && rm -rfv $(platanocompactdir)/plank
endif

if ENABLE_TELEGRAM
	test -e $(noirdir)/telegram && rm -rfv $(noirdir)/telegram
	test -e $(luminedir)/telegram && rm -rfv $(luminedir)/telegram
	test -e $(platanodir)/telegram && rm -rfv $(platanodir)/telegram
endif

if ENABLE_TWEETDECK
	test -e $(noirdir)/tweetdeck && rm -rfv $(noirdir)/tweetdeck
	test -e $(luminedir)/tweetdeck && rm -rfv $(luminedir)/tweetdeck
	test -e $(platanodir)/tweetdeck && rm -rfv $(platanodir)/tweetdeck
endif

if ENABLE_AIRFORSTEAM
	test -e $(noirdir)/airforsteam && rm -rfv $(noirdir)/airforsteam
endif

	test -e $(noirdir)/gtksourceview && rm -rfv $(noirdir)/gtksourceview
	test -e $(luminedir)/gtksourceview && rm -rfv $(luminedir)/gtksourceview
	test -e $(platanodir)/gtksourceview && rm -rfv $(platanodir)/gtksourceview

# ****************************
# * Clean up generated files *
# ****************************

CLEANFILES = \
	$(gtksourceviewdir)/platano-light.xml \
	$(gtksourceviewdir)/platano-dark.xml

if ENABLE_TWEETDECK
CLEANFILES += \
	$(tweetdeckdir)/light/ColorDeck-light.cdk \
	$(tweetdeckdir)/dark/ColorDeck-dark.cdk
endif

if ENABLE_TELEGRAM
CLEANFILES += \
	$(telegramdir)/light/colors.tdesktop-theme \
	$(telegramdir)/mixed/colors.tdesktop-theme \
	$(telegramdir)/dark/colors.tdesktop-theme \
	$(telegramdir)/platano.tdesktop-theme \
	$(telegramdir)/platano-lumine.tdesktop-theme \
	$(telegramdir)/platano-noir.tdesktop-theme
endif

if ENABLE_AIRFORSTEAM
CLEANFILES += \
	$(airdir)/Resource/colors/platano-noir.styles
endif

DISTCLEANFILES = \
	$(CLEANFILES)
