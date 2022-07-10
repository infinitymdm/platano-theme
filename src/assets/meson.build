# Color assets according to key selection and accent colors
assets_conf = configuration_data()
assets_conf.set('scss_sel_color', get_option('key_selection_color'))
assets_conf.set('scss_acc_color', get_option('key_accent_color'))

assets = configure_file(
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
    inkscape_opts_non_scale = [
        '--export-id=@0@'.format(asset),
        '--export-dpi=96',
        '--export-id-only',
        '--export-filename=@0@/@1@.png @0@/@2@'.format(
            assets_dir,
            asset,
            'assets.svg',
        )
    ]

    inkscape_opts_scale = [
        '--export-id=@0@'.format(asset),
        '--export-dpi=192',
        '--export-id-only',
        '--export-filename=@0@/@1@@2.png @0@/@2@'.format(
            assets_dir,
            asset,
            'assets.svg',
        )
    ]

    run_command(inkscape, inkscape_opts_non_scale, check:true)
    run_command(inkscape, inkscape_opts_scale, check:true)
endforeach