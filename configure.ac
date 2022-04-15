m4_define([platano_maj_ver], [0])
m4_define([platano_mnr_ver], [9])
m4_define([platano_mcr_ver], [8])
m4_define([platano_version], [platano_maj_ver.platano_mnr_ver.platano_mcr_ver])
m4_define([platano_git_url], [])

AC_INIT(
	[Platano ],
	[platano_version],
	[platano_git_url],
	[platano-theme]
)
AC_CONFIG_MACRO_DIR([m4])
AM_INIT_AUTOMAKE([
	-Wno-portability \
	no-dist-gzip \
	dist-xz \
	foreign \
	subdir-objects \
	1.9 \
	tar-ustar
])
AC_PREFIX_DEFAULT(/usr/local)
AM_SILENT_RULES([yes])

PLATANO_OPTION([PARALLEL],    [parallel],    [parallel-build],      [disable])
PLATANO_OPTION([GTK_NEXT],    [gtk_next],    [Gtk-4.0],             [disable])
PLATANO_OPTION([GNOME],       [gnome],       [Gnome-Shell],         [enable])
PLATANO_OPTION([CINNAMON],    [cinnamon],    [Cinnamon],            [enable])
PLATANO_OPTION([FLASHBACK],   [flashback],   [Flashback],           [enable])
PLATANO_OPTION([XFCE],        [xfce],        [XFce],                [enable])
PLATANO_OPTION([MATE],        [mate],        [Mate],                [enable])
PLATANO_OPTION([OPENBOX],     [openbox],     [Openbox],             [enable])
PLATANO_OPTION([PLANK],       [plank],       [Plank],               [disable])
PLATANO_OPTION([TELEGRAM],    [telegram],    [Telegram],            [disable])
PLATANO_OPTION([TWEETDECK],   [tweetdeck],   [Tweetdeck-Colordeck], [disable])
PLATANO_OPTION([AIRFORSTEAM], [airforsteam], [Air-for-Steam],       [disable])

PKG_PROG_PKG_CONFIG
AS_IF([test -z "$PKG_CONFIG"], [AC_MSG_ERROR(['pkg-config' not found.])])

PKG_CHECK_MODULES(GDK_PIXBUF, [gdk-pixbuf-2.0 >= 2.32.2])
PKG_CHECK_MODULES(GLIB,       [glib-2.0 >= 2.48.0])

AC_PATH_TOOL([GLIB_COMPILE_RESOURCES], [glib-compile-resources])
if test x"$GLIB_COMPILE_RESOURCES" = x; then
	AC_MSG_ERROR(['glib-compile-resources' not found.])
fi

AC_PATH_TOOL([XMLLINT], [xmllint])
if test x"$XMLLINT" = x; then
	AC_MSG_ERROR(['xmllint' not found.])
fi

AC_PATH_TOOL([INKSCAPE], [inkscape])
if test x"$INKSCAPE" = x; then
	AC_MSG_ERROR(['inkscape' not found.])
fi

AC_PATH_TOOL([SASSC], [sassc])
if test x"$SASSC" = x; then
	AC_MSG_ERROR(['sassc' not found.])
fi

if test x"$ENABLE_PARALLEL" = xyes; then
	AC_PATH_TOOL([PARALLEL], [parallel])
	if test x"$PARALLEL" = x; then
		AC_MSG_ERROR(['parallel' not found.])
	fi
fi

if test x"$ENABLE_TELEGRAM" = xyes; then
	AC_PATH_TOOL([ZIP], [zip])
	if test x"$ZIP" = x; then
		AC_MSG_ERROR(['zip' not found.])
	fi
fi

if test x"$ENABLE_GNOME" = xyes; then
	PLATANO_GNOME
fi
AM_CONDITIONAL(GNOME_IS_320_TO_324, [test x"$GNOME_SCSS_VERSION" = x3.24])
AM_CONDITIONAL(GNOME_IS_332_OR_NEWER, [test x"$GNOME_SCSS_VERSION" = x3.32])
AM_CONDITIONAL(GNOME_IS_336_OR_NEWER, [test x"$GNOME_SCSS_VERSION" = x3.36])
AM_CONDITIONAL(GNOME_IS_338_OR_NEWER, [test x"$GNOME_SCSS_VERSION" = x3.38])

if test x"$ENABLE_MATE" = xyes; then
	PKG_CHECK_MODULES(MACRO, [libmarco-private >= 1.22.2])
fi
PLATANO_MATE
AM_CONDITIONAL(ENABLE_MATE, [test x"$MATE_IS_SUPPORTED" = xyes])

PLATANO_COLOR_SCHEME

AC_CONFIG_FILES([
	Makefile \
	src/gtk/Makefile \
	src/shell/Makefile \
	src/wm/Makefile \
	src/extra/Makefile \
	data/Makefile
])
AC_OUTPUT
AC_MSG_RESULT([
        Platano Theme $VERSION
        =================================================================

         prefix:                 ${prefix}
         datarootdir:            ${datarootdir}
         target directories:     ${datarootdir}/themes/Platano
                                 ${datarootdir}/themes/Platano-Compact
                                 ${datarootdir}/themes/Platano-Lumine
                                 ${datarootdir}/themes/Platano-Lumine-Compact
                                 ${datarootdir}/themes/Platano-Noir
                                 ${datarootdir}/themes/Platano-Noir-Compact

         glib-compile-resources: $GLIB_COMPILE_RESOURCES
         xmllint:                $XMLLINT
         inkscape:               $INKSCAPE
         sassc:                  $SASSC

         parallel-build:         $ENABLE_PARALLEL (default: no)
         parallel:               $PARALLEL

         zip:                    $ZIP (if --enable-telegram)

         selection-color:        $SELECTION (default: $selection_default)
         accent-color:           $ACCENT (default: $accent_default)
         suggestion-color:       $SUGGESTION (default: $suggestion_default)
         destruction-color:      $DESTRUCTION (default: $destruction_default)

        -----------------------------------------------------------------
        | Supported Gtk Version
        -----------------------------------------------------------------

         Gtk 2.0:                always
         Gtk 3.20:               always
         Gtk 3.22:               always
         Gtk 3.24:               always
         Gtk 4.0:                $ENABLE_GTK_NEXT (default: no)

        -----------------------------------------------------------------
        | DE and WM Support
        -----------------------------------------------------------------

         Budgie-Desktop:         always (>= 10.4)
         GNOME:                  $ENABLE_GNOME (default: yes) (SCSS ver. $GNOME_SCSS_VERSION)
         Cinnamon:               $ENABLE_CINNAMON (default: yes)
         GNOME-Flashback:        $ENABLE_FLASHBACK (default: yes)
         XFce:                   $ENABLE_XFCE (default: yes)
         Mate:                   $ENABLE_MATE (default: yes)
         Openbox:                $ENABLE_OPENBOX (default: yes)

        -----------------------------------------------------------------
        | Extra Support
        -----------------------------------------------------------------

         GtkSourceView/Gedit:    always
         Plank:                  $ENABLE_PLANK (default: no)
         Telegram:               $ENABLE_TELEGRAM (default: no)
         Tweetdeck-Colordeck:    $ENABLE_TWEETDECK (default: no)
         Air-for-Steam:          $ENABLE_AIRFORSTEAM (default: no)

        =================================================================
                                   =>> run 'make' and 'sudo make install'
])
