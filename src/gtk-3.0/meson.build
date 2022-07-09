foreach theme: themes
    gtk3_dir = join_paths(theme['dir'], 'gtk-3.0')
    gtk3_variants = [
        'gtk',
    ]

    # Only non-dark themes need a dark variant
    if theme['variant'] != 'dark'
        gtk3_variants += 'gtk-dark'
    endif

    install_subdir(
        'assets',
        install_dir: gtk3_dir,
    )

    # Setup scss configuration
    gtk3_scss_conf = configuration_data()
    gtk3_scss_conf.set('scss_variant', theme['variant'])
    gtk3_scss_conf.set('scss_size', theme['size'])
    gtk3_scss_conf.set('current_src_dir', meson.current_source_dir())

    foreach gtk3_variant: gtk3_variants
        gtk3_temp_name = '@0@.gtk3.@1@'.format(theme['name'], gtk3_variant)

        gtk3_scss = configure_file(
            input: 'sass/gtk3.scss.in',
            output: '@0@.scss'.format(gtk3_temp_name),
            configuration: gtk3_scss_conf,
        )

        gtk3_css = custom_target(
            '@0@.css'.format(gtk3_temp_name),
            input: gtk3_scss,
            output: '@0@.css'.format(gtk3_temp_name),
            command: [sass, sass_opts, '@INPUT@', '@OUTPUT@'],
            depend_files: scss_dep_files,
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