# PLATA_GNOME ()
# -----------------------------------------------------------
AC_DEFUN([PLATA_GNOME], [

    # check glib-2.0 version for determining GNOME env version
    GIO_VERSION=`$PKG_CONFIG --modversion glib-2.0`
    GIO_MAJOR_VERSION=`echo $GIO_VERSION | cut -d'.' -f1`
    GIO_MINOR_VERSION=`echo $GIO_VERSION | cut -d'.' -f2`

    AS_IF(
        [test `echo $GIO_MAJOR_VERSION` -eq "2"], [
            GNOME_SCSS_VERSION="3.24"
            AS_IF(
                # switch to gnome-shell 3.26 theming if GIO >= 2.53
                [test `echo $GIO_MINOR_VERSION` -ge "53"],
                [GNOME_SCSS_VERSION="3.26"]
            )
            AS_IF(
                # switch to gnome-shell 3.32 theming if GIO >= 2.59
                [test `echo $GIO_MINOR_VERSION` -ge "59"],
                [GNOME_SCSS_VERSION="3.32"]
            )
            AS_IF(
                # switch to gnome-shell 3.34 theming if GIO >= 2.61
                [test `echo $GIO_MINOR_VERSION` -ge "61"],
                [GNOME_SCSS_VERSION="3.34"]
            )
            AS_IF(
                # switch to gnome-shell 3.36 theming if GIO >= 2.63
                [test `echo $GIO_MINOR_VERSION` -ge "63"],
                [GNOME_SCSS_VERSION="3.36"]
            )
            AS_IF(
                # switch to gnome-shell 3.38 theming if GIO >= 2.65
                [test `echo $GIO_MINOR_VERSION` -ge "65"],
                [GNOME_SCSS_VERSION="3.38"]
            )
            AC_SUBST([GNOME_SCSS_VERSION])
            AC_MSG_RESULT([checking for Gnome-Shell SCSS version... $GNOME_SCSS_VERSION])
        ])
])
