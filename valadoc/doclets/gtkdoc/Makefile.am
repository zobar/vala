include $(top_srcdir)/Makefile.common

NULL =

AM_CFLAGS = \
	-DPACKAGE_ICONDIR=\"$(datadir)/valadoc/icons/\" \
	-I$(top_srcdir)/gee/ \
	-I$(top_srcdir)/libvaladoc/ \
	$(GLIB_CFLAGS) \
	$(LIBGVC_CFLAGS) \
	$(NULL)

BUILT_SOURCES = libdoclet.vala.stamp

doclet_LTLIBRARIES = libdoclet.la

docletdir = $(libdir)/valadoc/doclets/gtkdoc

libdoclet_la_LDFLAGS = -module -avoid-version -no-undefined

libdoclet_la_VALASOURCES = \
	commentconverter.vala \
	dbus.vala \
	doclet.vala \
	gcomment.vala \
	generator.vala \
	utils.vala \
	$(NULL)

libdoclet_la_SOURCES = \
	libdoclet.vala.stamp \
	$(libdoclet_la_VALASOURCES:.vala=.c) \
	$(NULL)

libdoclet.vala.stamp: $(libdoclet_la_VALASOURCES)
	$(VALA_V)$(VALAC) \
		$(VALAFLAGS) \
		-C \
		--vapidir $(top_srcdir)/vala \
		--vapidir $(top_srcdir)/vapi \
		--vapidir $(top_srcdir)/libvaladoc --pkg valadoc@PACKAGE_SUFFIX@ \
		$(filter %.vala %.c,$^)
	touch $@

libdoclet_la_LIBADD = \
	$(top_builddir)/libvaladoc/libvaladoc@PACKAGE_SUFFIX@.la \
	$(GLIB_LIBS) \
	$(NULL)

EXTRA_DIST = \
	$(libdoclet_la_VALASOURCES) \
	libdoclet.vala.stamp \
	$(NULL)

MAINTAINERCLEANFILES = \
	$(libdoclet_la_VALASOURCES:.vala=.c) \
	$(NULL)

