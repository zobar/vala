valacodegen_sources = [
	'valaccodearraymodule.vala',
	'valaccodeassignmentmodule.vala',
	'valaccodeattribute.vala',
	'valaccodebasemodule.vala',
	'valaccodecompiler.vala',
	'valaccodecontrolflowmodule.vala',
	'valaccodedelegatemodule.vala',
	'valaccodememberaccessmodule.vala',
	'valaccodemethodcallmodule.vala',
	'valaccodemethodmodule.vala',
	'valaccodestructmodule.vala',
	'valaclassregisterfunction.vala',
	'valactype.vala',
	'valaenumregisterfunction.vala',
	'valagasyncmodule.vala',
	'valagdbusclientmodule.vala',
	'valagdbusmodule.vala',
	'valagdbusservermodule.vala',
	'valagerrormodule.vala',
	'valagirwriter.vala',
	'valagobjectmodule.vala',
	'valagsignalmodule.vala',
	'valagtkmodule.vala',
	'valagtypemodule.vala',
	'valagvariantmodule.vala',
	'valainterfaceregisterfunction.vala',
	'valastructregisterfunction.vala',
	'valatyperegisterfunction.vala'
]

valacodegen_lib = static_library(
	'valacodegen',
	valacodegen_sources,
	dependencies: [glib, gobject, valagee, valaccode, valacore],
	install: false,
	vala_args: ['--use-header'],
	vala_header: 'valacodegen.h',
	vala_vapi: 'valacodegen.vapi',
)

valacodegen = declare_dependency(link_with: [valacodegen_lib], include_directories: include_directories('.'))
