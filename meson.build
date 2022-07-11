project(
    'platano-theme',
    version: '0.1.0',
    license: 'GPLv2+',
    meson_version: '>=0.57.0',
    default_options: ['prefix=/usr'],
)

theme_base_name = get_option('theme_name')
theme_base_dir = join_paths(get_option('datadir'), 'themes', theme_base_name)

sh = find_program('sh')

sass = find_program('sassc')
sass_opts = []

themes = []
foreach variant: get_option('variants')
    foreach size: get_option('sizes')
        variant_suffix = variant == 'mixed' ? '' : '-@0@'.format(variant)
        size_suffix = size == 'default' ? '' : '-@0@'.format(size)
        scss_scale = size == 'default' ? '1.0' : '0.76'

        themes += {
            'name': theme_base_name + size_suffix + variant_suffix,
            'dir': theme_base_dir + size_suffix + variant_suffix,
            'variant': variant,
            'size': scss_scale,
        }
    endforeach
endforeach

foreach theme: themes
    install_data(
        [
            'COPYING',
            'LICENSE_CC_BY_SA4',
        ],
        install_dir: theme['dir'],
    )
endforeach

subdir('src')