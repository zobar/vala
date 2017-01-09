vapigen_sources = [
	'valagidlparser.vala',
	'valavapigen.vala'
]

vapigen_name = 'vapigen@0@'.format(vala_version_suffix)

executable(
	vapigen_name,
	vapigen_sources,
	dependencies: [glib, gobject, valagee, valacore, gidl],
	install: true,
	include_directories: include_directories('..'),
	vala_args: [
		'--pkg=config', '--vapidir=' + join_paths(meson.source_root(), 'vapi'),
		'--pkg=gidl', '--vapidir=' + join_paths(meson.source_root(), 'gobject-introspection')
	]
)

vapicheck_sources = [
	'valavapicheck.vala'
]

vapicheck_name = 'vapicheck@0@'.format(vala_version_suffix)

executable(
	vapicheck_name,
	vapicheck_sources,
	dependencies: [glib, gobject, valagee, valacore, gidl],
	install: true,
	vala_args: ['--pkg=gidl', '--vapidir=' + join_paths(meson.source_root(), 'gobject-introspection')]
)

configure_file(
	input: 'vapigen.pc.in',
	output: 'vapigen@0@.pc'.format(vala_version_suffix),
	configuration: pkgconf,
	install_dir: pkg_install_dir
)

install_data('vapigen.m4', install_dir: 'share/aclocal')
install_data('Makefile.vapigen', install_dir: 'share/vala')

subdir('vala-gen-introspect')
