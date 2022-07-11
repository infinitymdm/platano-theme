# Color assets according to key selection and accent colors
assets_conf = configuration_data()
assets_conf.set('scss_sel_color', get_option('key_selection_color'))
assets_conf.set('scss_acc_color', get_option('key_accent_color'))

assets_file = configure_file(
    input: 'assets.svg.in',
    output: 'assets.svg',
    configuration: assets_conf,
)

# Render icons
inkscape = find_program('inkscape')

fs = import('fs')
assets_dir = '@0@/src/assets'.format(meson.project_build_root())
assets_list = fs.read('assets.txt').strip().split('\n')

foreach asset : assets_list
    run_command(
        './render-asset.sh',
        asset,
        assets_file,
        assets_dir,
        check: true,
    )
endforeach