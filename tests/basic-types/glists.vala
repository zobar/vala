void test_glist () {
	var list = new GLib.List<string> ();
	list.prepend ("foo");
	list.prepend ("bar");
	assert (list.nth_data (1) == "foo");
	list = null;

	var list2 = new GLib.List<unowned string> ();
	list2.prepend ("foo");
	list2.prepend ("bar");
	assert (list2.nth_data (1) == "foo");
	list2 = null;
}

void test_gslist () {
	var list = new GLib.SList<string> ();
	list.prepend ("foo");
	list.prepend ("bar");
	assert (list.nth_data (1) == "foo");
	list = null;

	var list2 = new GLib.SList<unowned string> ();
	list2.prepend ("foo");
	list2.prepend ("bar");
	assert (list2.nth_data (1) == "foo");
	list2 = null;
}

void test_gqueue () {
	var queue = new GLib.Queue<string> ();
	queue.push_head ("foo");
	queue.push_head ("bar");
	assert (queue.peek_nth (1) == "foo");
	queue = null;

	var queue2 = new GLib.Queue<unowned string> ();
	queue2.push_head ("foo");
	queue2.push_head ("bar");
	assert (queue2.peek_nth (1) == "foo");
	queue2 = null;
}

void main () {
	test_glist ();
	test_gslist ();
	test_gqueue ();
}
