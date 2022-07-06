gtk3_scss_dep_files = files([
    '../_animations.scss',
    '../_colors-public.scss',
    '../_colors.scss',
    '../_drawing.scss',
    '../_functions.scss',
    '../_key_colors.scss',
    '../_main.scss',
    '../_palette.scss',
    '../_variables.scss',
    '../widgets/_appicons.scss',
    '../widgets/_assistant.scss',
    '../widgets/_base.scss',
    '../widgets/_buttons.scss',
    '../widgets/_calendar.scss',
    '../widgets/_checkradios.scss',
    '../widgets/_colorchooser.scss',
    '../widgets/_comboboxes.scss',
    '../widgets/_decorations.scss',
    '../widgets/_dialogs.scss',
    '../widgets/_emojipicker.scss',
    '../widgets/_expanders.scss',
    '../widgets/_filechoosers.scss',
    '../widgets/_flowbox.scss',
    '../widgets/_frames.scss',
    '../widgets/_headerbars.scss',
    '../widgets/_index.scss',
    '../widgets/_infobar.scss',
    '../widgets/_levelbars.scss',
    '../widgets/_links.scss',
    '../widgets/_lists.scss',
    '../widgets/_menus.scss',
    '../widgets/_notebooks.scss',
    '../widgets/_notifications.scss',
    '../widgets/_paned.scss',
    '../widgets/_pathbars.scss',
    '../widgets/_popovers.scss',
    '../widgets/_printdialogs.scss',
    '../widgets/_progressbars.scss',
    '../widgets/_scales.scss',
    '../widgets/_scrollbars.scss',
    '../widgets/_selections.scss',
    '../widgets/_shortcuts.scss',
    '../widgets/_sidebars.scss',
    '../widgets/_spinbutton.scss',
    '../widgets/_spinner.scss',
    '../widgets/_switches.scss',
    '../widgets/_textentries.scss',
    '../widgets/_toolbars.scss',
    '../widgets/_tooltips.scss',
    '../widgets/_touchhandles.scss',
    '../widgets/_treeviews.scss',
    '../widgets/_typography.scss',
    '../widgets/_video.scss',
])

foreach theme: themes
    gtk3_dir = join_paths(theme['dir'], 'gtk-3.0')
    gtk3_variants = [
        'gtk',
    ]

    # Only non-dark themes need a dark variant
    if theme['color'] != '-dark'
        gtk3_variants += 'gtk-dark'
    endif

    install_subdir(
        'assets',
        install_dir: gtk3_dir,
    )

    # Setup scss configuration
    gtk3_scss_conf = configuration_data()
    gtk3_scss_conf.set('gtk3_theme_color', theme['scss_color'])
    gtk3_scss_conf.set('gtk3_theme_size', theme['scss_size'])
    gtk3_scss_conf.set('current_source_dir', meson.current_source_dir())

    foreach gtk3_variant: gtk3_variants
        gtk3_temp_name = '@0@.gtk3.@1@'.format(theme['name'], gtk3_variant)

        gtk3_scss = configure_file(
            input: 'sass/gtk.scss.in',
            output: '@0@.scss'.format(gtk3_temp_name),
            configuration: gtk3_scss_conf,
        )

        gtk3_css = custom_target(
            '@0@.css'.format(gtk3_temp_name),
            input: gtk3_scss,
            output: '@0@.css'.format(gtk3_temp_name),
            command: [sass, sass_opts, '@INPUT@', '@OUTPUT@'],
            depend_files: gtk3_scss_dep_files,
            build_by_default: true,
        )

        # Install and rename
        meson.add_install_script(
            sh, '-c', 'cp "@0@" "@1@"'.format(
                gtk3_css.full_path(),
                join_paths('$MESON_INSTALL_DESTDIR_PREFIX', gtk3_dir, '@0@.css'.format(gtk3_variant)),
            ),
        )
    endforeach
endforeach