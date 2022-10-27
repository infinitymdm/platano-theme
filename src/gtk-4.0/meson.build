foreach theme : themes
    gtk4_dir = join_paths(theme['dir'], 'gtk-4.0')

    gtk4_temp_name = '@0@.gtk4'.format(theme['name'])
    
    adw_color_conf = configuration_data()
    adw_color_conf.set('adw_acc_color', get_option('key_selection_color'))
    adw_color_conf.set('adw_bg_color', theme['variant'] == 'dark' ? '#1d1d1d' : '#ffffff')
    adw_color_conf.set('adw_fg_color', theme['variant'] == 'dark' ? '#f5f5f5' : '#111111')
    adw_color_conf.set('adw_header_bg_color', theme['variant'] == 'light' ? '#e7e7e7' : '#080808')
    adw_color_conf.set('adw_header_fg_color', theme['variant'] == 'light' ? '#111111' : '#f5f5f5')
    adw_color_conf.set('adw_card_bg_color', theme['variant'] == 'dark' ? '#2a2a2a' : '#eaeaea')

    adw_color_css = configure_file(
        input: 'libadwaita.css.in',
        output: '@0@.css'.format(gtk4_temp_name),
        configuration: adw_color_conf,
    )

    install_data(
        adw_color_css,
        rename: 'gtk.css',
        install_dir: gtk4_dir,
    )
endforeach