scss_dep_files = files([
    '_animations.scss',
    '_colors-public.scss',
    '_colors.scss',
    '_drawing.scss',
    '_functions.scss',
    '_main.scss',
    '_palette.scss',
    '_variables.scss',
    'widgets/_appicons.scss',
    'widgets/_assistant.scss',
    'widgets/_base.scss',
    'widgets/_buttons.scss',
    'widgets/_calendar.scss',
    'widgets/_checkradios.scss',
    'widgets/_colorchooser.scss',
    'widgets/_comboboxes.scss',
    'widgets/_decorations.scss',
    'widgets/_dialogs.scss',
    'widgets/_emojipicker.scss',
    'widgets/_expanders.scss',
    'widgets/_filechoosers.scss',
    'widgets/_flowbox.scss',
    'widgets/_frames.scss',
    'widgets/_headerbars.scss',
    'widgets/_index.scss',
    'widgets/_infobar.scss',
    'widgets/_levelbars.scss',
    'widgets/_links.scss',
    'widgets/_lists.scss',
    'widgets/_menus.scss',
    'widgets/_notebooks.scss',
    'widgets/_notifications.scss',
    'widgets/_paned.scss',
    'widgets/_pathbars.scss',
    'widgets/_popovers.scss',
    'widgets/_printdialogs.scss',
    'widgets/_progressbars.scss',
    'widgets/_scales.scss',
    'widgets/_scrollbars.scss',
    'widgets/_selections.scss',
    'widgets/_shortcuts.scss',
    'widgets/_sidebars.scss',
    'widgets/_spinbutton.scss',
    'widgets/_spinner.scss',
    'widgets/_switches.scss',
    'widgets/_textentries.scss',
    'widgets/_toolbars.scss',
    'widgets/_tooltips.scss',
    'widgets/_touchhandles.scss',
    'widgets/_treeviews.scss',
    'widgets/_typography.scss',
    'widgets/_video.scss',
])

# Get key colors
key_color_scss_conf = configuration_data()
key_color_scss_conf.set('scss_sel_color', get_option('key_selection_color'))
key_color_scss_conf.set('scss_acc_color', get_option('key_accent_color'))
key_color_scss_conf.set('scss_sgst_color', get_option('key_suggestion_color'))
key_color_scss_conf.set('scss_dest_color', get_option('key_destruction_color'))

key_color_scss = configure_file(
    input: '_key_colors.scss.in',
    output: '_key_colors.scss',
    configuration: key_color_scss_conf,
)

# Build index file for each theme
foreach theme: themes
    index_theme_conf = configuration_data()
    index_theme_conf.set('theme_name', theme['name'])

    index_theme = configure_file(
        input: 'index.theme.in',
        output: '@0@.index.theme'.format(theme['name']),
        configuration: index_theme_conf,
    )

    install_data(
        index_theme,
        rename: 'index.theme',
        install_dir: theme['dir'],
    )
endforeach

subdir('assets')
subdir('gtk-3.0')