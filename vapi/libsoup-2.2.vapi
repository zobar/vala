/* libsoup-2.2.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "Soup", lower_case_cprefix = "soup_")]
namespace Soup {
	[CCode (cheader_filename = "libsoup/soup.h")]
	public class Address : GLib.Object {
		[CCode (has_construct_function = false)]
		public Address.any (Soup.AddressFamily family, uint port);
		public unowned string get_name ();
		public unowned string get_physical ();
		public uint get_port ();
		public void* get_sockaddr (int len);
		[CCode (has_construct_function = false)]
		public Address (string name, uint port);
		public void resolve_async (Soup.AddressCallback callback);
		public void resolve_async_full (GLib.MainContext async_context, Soup.AddressCallback callback);
		public uint resolve_sync ();
		public virtual signal void dns_result (int status);
	}
	[CCode (cheader_filename = "libsoup/soup.h")]
	public class Connection : GLib.Object {
		public void connect_async (Soup.ConnectionCallback callback);
		public uint connect_sync ();
		public void disconnect ();
		public bool is_in_use ();
		public ulong last_used ();
		[CCode (has_construct_function = false)]
		public Connection (string propname1);
		public void release ();
		public void reserve ();
		public virtual void send_request (Soup.Message req);
		[NoAccessorMethod]
		public void* async_context { get; construct; }
		[NoAccessorMethod]
		public void* message_filter { get; set; }
		[NoAccessorMethod]
		public void* origin_uri { get; construct; }
		[NoAccessorMethod]
		public void* proxy_uri { get; construct; }
		[NoAccessorMethod]
		public void* ssl_creds { get; construct; }
		[NoAccessorMethod]
		public uint timeout { get; set; }
		[HasEmitter]
		public virtual signal void authenticate (Soup.Message p0, string auth_type, string auth_realm, void* username, void* password);
		public virtual signal void connect_result (int p0);
		public virtual signal void disconnected ();
		[HasEmitter]
		public virtual signal void reauthenticate (Soup.Message p0, string auth_type, string auth_realm, void* username, void* password);
	}
	[CCode (cheader_filename = "libsoup/soup.h")]
	public class Message : GLib.Object {
		public weak string method;
		public weak string reason_phrase;
		public Soup.DataBuffer request;
		public weak GLib.HashTable request_headers;
		public Soup.DataBuffer response;
		public weak GLib.HashTable response_headers;
		public Soup.MessageStatus status;
		public uint status_code;
		public void add_chunk (Soup.Ownership owner, owned string body, uint length);
		public void add_final_chunk ();
		public void add_handler (Soup.HandlerPhase phase, Soup.MessageCallbackFn handler_cb);
		public static void add_header (GLib.HashTable hash, string name, string value);
		public void add_header_handler (string header, Soup.HandlerPhase phase, Soup.MessageCallbackFn handler_cb);
		public void add_status_class_handler (Soup.StatusClass status_class, Soup.HandlerPhase phase, Soup.MessageCallbackFn handler_cb);
		public void add_status_code_handler (uint status_code, Soup.HandlerPhase phase, Soup.MessageCallbackFn handler_cb);
		public static void clear_headers (GLib.HashTable hash);
		[CCode (has_construct_function = false)]
		public Message.from_uri (string method, Soup.Uri uri);
		public uint get_flags ();
		public static unowned string get_header (GLib.HashTable hash, string name);
		public static unowned GLib.SList get_header_list (GLib.HashTable hash, string name);
		public Soup.HttpVersion get_http_version ();
		public Soup.TransferEncoding get_request_encoding (uint content_length);
		public Soup.TransferEncoding get_response_encoding (uint content_length);
		public unowned Soup.Uri get_uri ();
		public bool io_in_progress ();
		public void io_pause ();
		public void io_stop ();
		public void io_unpause ();
		public bool is_keepalive ();
		[CCode (has_construct_function = false)]
		public Message (string method, string uri_string);
		public void read_request (Soup.Socket sock);
		public void remove_handler (Soup.HandlerPhase phase, Soup.MessageCallbackFn handler_cb);
		public static void remove_header (GLib.HashTable hash, string name);
		public void send_request (Soup.Socket sock, bool is_via_proxy);
		public void set_flags (uint flags);
		public void set_http_version (Soup.HttpVersion version);
		public void set_request (string content_type, Soup.Ownership req_owner, owned string req_body, ulong req_length);
		public void set_response (string content_type, Soup.Ownership resp_owner, owned string resp_body, ulong resp_length);
		public void set_status (uint status_code);
		public void set_status_full (uint status_code, string reason_phrase);
		public void set_uri (Soup.Uri uri);
		[HasEmitter]
		public virtual signal void finished ();
		[HasEmitter]
		public virtual signal void got_body ();
		[HasEmitter]
		public virtual signal void got_chunk ();
		[HasEmitter]
		public virtual signal void got_headers ();
		[HasEmitter]
		public virtual signal void got_informational ();
		[HasEmitter]
		public virtual signal void restarted ();
		[HasEmitter]
		public virtual signal void wrote_body ();
		[HasEmitter]
		public virtual signal void wrote_chunk ();
		[HasEmitter]
		public virtual signal void wrote_headers ();
		[HasEmitter]
		public virtual signal void wrote_informational ();
	}
	[Compact]
	[CCode (free_function = "soup_message_queue_destroy", cheader_filename = "libsoup/soup.h")]
	public class MessageQueue {
		public void append (Soup.Message msg);
		public unowned Soup.Message first (Soup.MessageQueueIter iter);
		public void free_iter (Soup.MessageQueueIter iter);
		[CCode (has_construct_function = false)]
		public MessageQueue ();
		public unowned Soup.Message next (Soup.MessageQueueIter iter);
		public unowned Soup.Message remove (Soup.MessageQueueIter iter);
		public void remove_message (Soup.Message msg);
	}
	[Compact]
	[CCode (cheader_filename = "libsoup/soup.h")]
	public class MessageQueueIter {
		public weak GLib.List cur;
		public weak GLib.List next;
	}
	[Compact]
	[CCode (cheader_filename = "libsoup/soup.h")]
	public class Protocol {
	}
	[CCode (cheader_filename = "libsoup/soup.h")]
	public class Server : GLib.Object {
		public void add_handler (string path, Soup.ServerAuthContext auth_ctx, Soup.ServerCallbackFn callback, Soup.ServerUnregisterFn unreg, void* data);
		public unowned GLib.MainContext get_async_context ();
		public unowned Soup.ServerHandler get_handler (string path);
		public unowned Soup.Socket get_listener ();
		public uint get_port ();
		public unowned Soup.Protocol get_protocol ();
		public unowned GLib.SList list_handlers ();
		[CCode (has_construct_function = false)]
		public Server (string optname1, ...);
		public void quit ();
		public void remove_handler (string path);
		public void run ();
		public void run_async ();
		public void* async_context { get; construct; }
		[NoAccessorMethod]
		public Soup.Address @interface { owned get; construct; }
		public uint port { get; construct; }
		[NoAccessorMethod]
		public string ssl_cert_file { owned get; construct; }
		[NoAccessorMethod]
		public string ssl_key_file { owned get; construct; }
	}
	[Compact]
	[CCode (cheader_filename = "libsoup/soup.h")]
	public class ServerAuth {
		public weak Soup.ServerAuthBasic basic;
		public weak Soup.ServerAuthDigest digest;
		public Soup.AuthType type;
		public bool check_passwd (string passwd);
		public unowned string get_user ();
		[CCode (has_construct_function = false)]
		public ServerAuth (Soup.ServerAuthContext auth_ctx, GLib.SList auth_hdrs, Soup.Message msg);
	}
	[Compact]
	[CCode (cheader_filename = "libsoup/soup.h")]
	public class ServerAuthBasic {
		public weak string passwd;
		public Soup.AuthType type;
		public weak string user;
	}
	[Compact]
	[CCode (cheader_filename = "libsoup/soup.h")]
	public class ServerAuthContext {
		public void* basic_info;
		public weak Soup.ServerAuthCallbackFn callback;
		public void* digest_info;
		public uint types;
		public void* user_data;
		public void challenge (Soup.Message msg, string header_name);
	}
	[Compact]
	[CCode (cheader_filename = "libsoup/soup.h")]
	public class ServerAuthDigest {
		public Soup.DigestAlgorithm algorithm;
		public weak string cnonce;
		public weak string digest_response;
		public weak string digest_uri;
		public bool integrity;
		public weak string nonce;
		public int nonce_count;
		public weak string realm;
		public weak string request_method;
		public Soup.AuthType type;
		public weak string user;
	}
	[Compact]
	[CCode (cheader_filename = "libsoup/soup.h")]
	public class ServerContext {
		public weak Soup.ServerAuth auth;
		public weak Soup.ServerHandler handler;
		public Soup.MethodId method_id;
		public weak Soup.Message msg;
		public weak string path;
		public weak Soup.Server server;
		public weak Soup.Socket sock;
		public unowned Soup.Address get_client_address ();
		public unowned string get_client_host ();
	}
	[Compact]
	[CCode (cheader_filename = "libsoup/soup.h")]
	public class ServerHandler {
		public weak Soup.ServerAuthContext auth_ctx;
		public weak Soup.ServerCallbackFn callback;
		public weak string path;
		public weak Soup.ServerUnregisterFn unregister;
		public void* user_data;
	}
	[CCode (cheader_filename = "libsoup/soup.h")]
	public class ServerMessage : Soup.Message {
		public void finish ();
		public Soup.TransferEncoding get_encoding ();
		public unowned Soup.Server get_server ();
		public bool is_finished ();
		public bool is_started ();
		[CCode (has_construct_function = false)]
		public ServerMessage (Soup.Server server);
		public void set_encoding (Soup.TransferEncoding encoding);
		public void start ();
	}
	[CCode (cheader_filename = "libsoup/soup.h")]
	public class Session : GLib.Object, Soup.MessageFilter {
		public weak Soup.MessageQueue queue;
		public void abort ();
		public void add_filter (Soup.MessageFilter filter);
		public virtual void cancel_message (Soup.Message msg);
		public unowned GLib.MainContext get_async_context ();
		public unowned Soup.Connection get_connection (Soup.Message msg, bool try_pruning, bool is_new);
		public virtual void queue_message (owned Soup.Message msg, Soup.MessageCallbackFn callback);
		public void remove_filter (Soup.MessageFilter filter);
		public virtual void requeue_message (Soup.Message msg);
		public virtual uint send_message (Soup.Message msg);
		public bool try_prune_connection ();
		public void* async_context { get; construct; }
		[NoAccessorMethod]
		public int max_conns { get; set; }
		[NoAccessorMethod]
		public int max_conns_per_host { get; set; }
		[NoAccessorMethod]
		public void* proxy_uri { get; set; }
		[NoAccessorMethod]
		public string ssl_ca_file { owned get; set; }
		[NoAccessorMethod]
		public uint timeout { get; set; }
		[NoAccessorMethod]
		public bool use_ntlm { get; set; }
		public virtual signal void authenticate (Soup.Message p0, string auth_type, string auth_realm, void* username, void* password);
		public virtual signal void reauthenticate (Soup.Message p0, string auth_type, string auth_realm, void* username, void* password);
	}
	[CCode (cheader_filename = "libsoup/soup.h")]
	public class SessionAsync : Soup.Session, Soup.MessageFilter {
		[CCode (type = "SoupSession*", has_construct_function = false)]
		public SessionAsync ();
		[CCode (type = "SoupSession*", has_construct_function = false)]
		public SessionAsync.with_options (string optname1);
	}
	[CCode (cheader_filename = "libsoup/soup.h")]
	public class SessionSync : Soup.Session, Soup.MessageFilter {
		[CCode (type = "SoupSession*", has_construct_function = false)]
		public SessionSync ();
		[CCode (type = "SoupSession*", has_construct_function = false)]
		public SessionSync.with_options (string optname1);
	}
	[Compact]
	[CCode (cheader_filename = "libsoup/soup.h")]
	public class SoapParameter {
		public unowned Soup.SoapParameter get_first_child ();
		public unowned Soup.SoapParameter get_first_child_by_name (string name);
		public int get_int_value ();
		public unowned string get_name ();
		public unowned Soup.SoapParameter get_next_child ();
		public unowned Soup.SoapParameter get_next_child_by_name (string name);
		public unowned string get_property (string prop_name);
		public unowned string get_string_value ();
	}
	[CCode (cheader_filename = "libsoup/soup.h")]
	public class Socket : GLib.Object {
		public static unowned Soup.Socket client_new_async (string hostname, uint port, void* ssl_creds, Soup.SocketCallback callback);
		public static unowned Soup.Socket client_new_sync (string hostname, uint port, void* ssl_creds, uint status_ret);
		public uint connect (Soup.Address remote_addr);
		public void disconnect ();
		public unowned Soup.Address get_local_address ();
		public unowned Soup.Address get_remote_address ();
		public bool is_connected ();
		public bool listen (Soup.Address local_addr);
		[CCode (has_construct_function = false)]
		public Socket (string optname1);
		public Soup.SocketIOStatus read (void* buffer, size_t len, size_t nread);
		public Soup.SocketIOStatus read_until (void* buffer, size_t len, void* boundary, size_t boundary_len, size_t nread, bool got_boundary);
		public static unowned Soup.Socket server_new (Soup.Address local_addr, void* ssl_creds, Soup.SocketListenerCallback callback);
		public bool start_proxy_ssl (string ssl_host);
		public bool start_ssl ();
		public Soup.SocketIOStatus write (void* buffer, size_t len, size_t nwrote);
		[NoAccessorMethod]
		public void* async_context { get; construct; }
		[NoAccessorMethod]
		public bool cloexec { get; set; }
		[NoAccessorMethod]
		public bool is_server { get; }
		[NoAccessorMethod]
		public bool nodelay { get; set; }
		[NoAccessorMethod]
		public bool non_blocking { get; set; }
		[NoAccessorMethod]
		public bool reuseaddr { get; set; }
		[NoAccessorMethod]
		public void* ssl_creds { get; set; }
		[NoAccessorMethod]
		public uint timeout { get; set; }
		public virtual signal void connect_result (int p0);
		public virtual signal void disconnected ();
		public virtual signal void new_connection (Soup.Socket p0);
		public virtual signal void readable ();
		public virtual signal void writable ();
	}
	[Compact]
	[CCode (copy_function = "soup_uri_copy", cheader_filename = "libsoup/soup.h")]
	public class Uri {
		public bool broken_encoding;
		public weak string fragment;
		public weak string host;
		public weak string passwd;
		public weak string path;
		public uint port;
		public weak Soup.Protocol protocol;
		public weak string query;
		public weak string user;
		public unowned Soup.Uri copy ();
		public unowned Soup.Uri copy_root ();
		public static void decode (string part);
		public static string encode (string part, string escape_extra);
		public bool equal (Soup.Uri uri2);
		[CCode (has_construct_function = false)]
		public Uri (string uri_string);
		public unowned string to_string (bool just_path);
		public bool uses_default_port ();
		[CCode (has_construct_function = false)]
		public Uri.with_base (Soup.Uri @base, string uri_string);
	}
	[Compact]
	[CCode (cheader_filename = "libsoup/soup.h")]
	public class XmlrpcValue {
		public bool array_get_iterator (out unowned Soup.XmlrpcValueArrayIterator iter);
		public void dump ();
		public bool get_base64 (out unowned GLib.ByteArray data);
		public bool get_boolean (bool b);
		public bool get_datetime (ulong timeval);
		public bool get_double (double b);
		public bool get_int (long i);
		public bool get_string (out unowned string str);
		public bool get_struct (GLib.HashTable table);
	}
	[Compact]
	[CCode (cheader_filename = "libsoup/soup.h")]
	public class XmlrpcValueArrayIterator {
		public bool get_value (out unowned Soup.XmlrpcValue value);
		public unowned Soup.XmlrpcValueArrayIterator next ();
		public unowned Soup.XmlrpcValueArrayIterator prev ();
	}
	[CCode (cheader_filename = "libsoup/soup.h")]
	public interface MessageFilter {
		public abstract void setup_message (Soup.Message msg);
	}
	[CCode (type_id = "SOUP_TYPE_DATA_BUFFER", cheader_filename = "libsoup/soup.h")]
	public struct DataBuffer {
		public Soup.Ownership owner;
		public string body;
		public uint length;
	}
	[CCode (cprefix = "SOUP_ADDRESS_FAMILY_", has_type_id = "0", cheader_filename = "libsoup/soup.h")]
	public enum AddressFamily {
		IPV4,
		IPV6
	}
	[CCode (cprefix = "SOUP_AUTH_TYPE_", has_type_id = "0", cheader_filename = "libsoup/soup.h")]
	public enum AuthType {
		BASIC,
		DIGEST
	}
	[CCode (cprefix = "SOUP_ALGORITHM_", has_type_id = "0", cheader_filename = "libsoup/soup.h")]
	public enum DigestAlgorithm {
		MD5,
		MD5_SESS
	}
	[CCode (cprefix = "SOUP_HANDLER_", has_type_id = "0", cheader_filename = "libsoup/soup.h")]
	public enum HandlerPhase {
		POST_REQUEST,
		PRE_BODY,
		BODY_CHUNK,
		POST_BODY
	}
	[CCode (cprefix = "SOUP_HTTP_", has_type_id = "0", cheader_filename = "libsoup/soup.h")]
	public enum HttpVersion {
		1_0,
		1_1
	}
	[CCode (cprefix = "SOUP_STATUS_", has_type_id = "0", cheader_filename = "libsoup/soup.h")]
	public enum KnownStatusCode {
		NONE,
		CANCELLED,
		CANT_RESOLVE,
		CANT_RESOLVE_PROXY,
		CANT_CONNECT,
		CANT_CONNECT_PROXY,
		SSL_FAILED,
		IO_ERROR,
		MALFORMED,
		TRY_AGAIN,
		CONTINUE,
		SWITCHING_PROTOCOLS,
		PROCESSING,
		OK,
		CREATED,
		ACCEPTED,
		NON_AUTHORITATIVE,
		NO_CONTENT,
		RESET_CONTENT,
		PARTIAL_CONTENT,
		MULTI_STATUS,
		MULTIPLE_CHOICES,
		MOVED_PERMANENTLY,
		FOUND,
		MOVED_TEMPORARILY,
		SEE_OTHER,
		NOT_MODIFIED,
		USE_PROXY,
		NOT_APPEARING_IN_THIS_PROTOCOL,
		TEMPORARY_REDIRECT,
		BAD_REQUEST,
		UNAUTHORIZED,
		PAYMENT_REQUIRED,
		FORBIDDEN,
		NOT_FOUND,
		METHOD_NOT_ALLOWED,
		NOT_ACCEPTABLE,
		PROXY_AUTHENTICATION_REQUIRED,
		PROXY_UNAUTHORIZED,
		REQUEST_TIMEOUT,
		CONFLICT,
		GONE,
		LENGTH_REQUIRED,
		PRECONDITION_FAILED,
		REQUEST_ENTITY_TOO_LARGE,
		REQUEST_URI_TOO_LONG,
		UNSUPPORTED_MEDIA_TYPE,
		REQUESTED_RANGE_NOT_SATISFIABLE,
		INVALID_RANGE,
		EXPECTATION_FAILED,
		UNPROCESSABLE_ENTITY,
		LOCKED,
		FAILED_DEPENDENCY,
		INTERNAL_SERVER_ERROR,
		NOT_IMPLEMENTED,
		BAD_GATEWAY,
		SERVICE_UNAVAILABLE,
		GATEWAY_TIMEOUT,
		HTTP_VERSION_NOT_SUPPORTED,
		INSUFFICIENT_STORAGE,
		NOT_EXTENDED
	}
	[CCode (cprefix = "SOUP_MESSAGE_", has_type_id = "0", cheader_filename = "libsoup/soup.h")]
	public enum MessageFlags {
		NO_REDIRECT,
		OVERWRITE_CHUNKS,
		EXPECT_CONTINUE
	}
	[CCode (cprefix = "SOUP_MESSAGE_STATUS_", has_type_id = "0", cheader_filename = "libsoup/soup.h")]
	public enum MessageStatus {
		IDLE,
		QUEUED,
		CONNECTING,
		RUNNING,
		FINISHED
	}
	[CCode (cprefix = "SOUP_METHOD_ID_", has_type_id = "0", cheader_filename = "libsoup/soup.h")]
	public enum MethodId {
		UNKNOWN,
		POST,
		GET,
		HEAD,
		OPTIONS,
		PUT,
		MOVE,
		COPY,
		DELETE,
		TRACE,
		CONNECT,
		MKCOL,
		PROPPATCH,
		PROPFIND,
		PATCH,
		LOCK,
		UNLOCK
	}
	[CCode (cprefix = "SOUP_BUFFER_", has_type_id = "0", cheader_filename = "libsoup/soup.h")]
	public enum Ownership {
		SYSTEM_OWNED,
		USER_OWNED,
		STATIC
	}
	[CCode (cprefix = "SOUP_SOCKET_", has_type_id = "0", cheader_filename = "libsoup/soup.h")]
	public enum SocketIOStatus {
		OK,
		WOULD_BLOCK,
		EOF,
		ERROR
	}
	[CCode (cprefix = "SOUP_STATUS_CLASS_", has_type_id = "0", cheader_filename = "libsoup/soup.h")]
	public enum StatusClass {
		TRANSPORT_ERROR,
		INFORMATIONAL,
		SUCCESS,
		REDIRECT,
		CLIENT_ERROR,
		SERVER_ERROR
	}
	[CCode (cprefix = "SOUP_TRANSFER_", has_type_id = "0", cheader_filename = "libsoup/soup.h")]
	public enum TransferEncoding {
		UNKNOWN,
		CHUNKED,
		CONTENT_LENGTH,
		BYTERANGES,
		NONE,
		EOF
	}
	[CCode (cprefix = "SOUP_XMLRPC_VALUE_TYPE_", has_type_id = "0", cheader_filename = "libsoup/soup.h")]
	public enum XmlrpcValueType {
		BAD,
		INT,
		BOOLEAN,
		STRING,
		DOUBLE,
		DATETIME,
		BASE64,
		STRUCT,
		ARRAY
	}
	[CCode (cheader_filename = "libsoup/soup.h")]
	public delegate void AddressCallback (Soup.Address addr, uint status);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public delegate void ConnectionCallback (Soup.Connection conn, uint status);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public delegate void MessageCallbackFn (Soup.Message req);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public delegate bool ServerAuthCallbackFn (Soup.ServerAuthContext auth_ctx, Soup.ServerAuth auth, Soup.Message msg);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public delegate void ServerCallbackFn (Soup.ServerContext context, Soup.Message msg);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public delegate void ServerUnregisterFn (Soup.Server server, Soup.ServerHandler handler);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public delegate void SocketCallback (Soup.Socket sock, uint status);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public delegate void SocketListenerCallback (Soup.Socket listener, Soup.Socket sock);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const int ADDRESS_ANY_PORT;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string CONNECTION_ASYNC_CONTEXT;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const int CONNECTION_H;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string CONNECTION_MESSAGE_FILTER;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string CONNECTION_ORIGIN_URI;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string CONNECTION_PROXY_URI;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string CONNECTION_SSL_CREDENTIALS;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string CONNECTION_TIMEOUT;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const int DATE_H;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const int H;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const int HEADERS_H;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const int MESSAGE_FILTER_H;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const int MESSAGE_H;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const int MESSAGE_QUEUE_H;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string METHOD_CONNECT;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string METHOD_COPY;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string METHOD_DELETE;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string METHOD_GET;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const int METHOD_H;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string METHOD_HEAD;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string METHOD_LOCK;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string METHOD_MKCOL;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string METHOD_MOVE;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string METHOD_OPTIONS;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string METHOD_PATCH;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string METHOD_POST;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string METHOD_PROPFIND;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string METHOD_PROPPATCH;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string METHOD_PUT;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string METHOD_TRACE;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string METHOD_UNLOCK;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const int MISC_H;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string SERVER_ASYNC_CONTEXT;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const int SERVER_AUTH_H;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const int SERVER_H;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string SERVER_INTERFACE;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const int SERVER_MESSAGE_H;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string SERVER_PORT;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string SERVER_SSL_CERT_FILE;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string SERVER_SSL_KEY_FILE;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string SESSION_ASYNC_CONTEXT;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const int SESSION_ASYNC_H;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const int SESSION_H;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string SESSION_MAX_CONNS;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string SESSION_MAX_CONNS_PER_HOST;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string SESSION_PROXY_URI;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string SESSION_SSL_CA_FILE;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const int SESSION_SYNC_H;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string SESSION_TIMEOUT;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string SESSION_USE_NTLM;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const int SOAP_MESSAGE_H;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string SOCKET_ASYNC_CONTEXT;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string SOCKET_FLAG_CLOEXEC;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string SOCKET_FLAG_NODELAY;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string SOCKET_FLAG_NONBLOCKING;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string SOCKET_FLAG_REUSEADDR;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const int SOCKET_H;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string SOCKET_IS_SERVER;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string SOCKET_SSL_CREDENTIALS;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const string SOCKET_TIMEOUT;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const int STATUS_H;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const int TYPES_H;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public const int URI_H;
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static unowned GLib.TimeoutSource add_idle (GLib.MainContext async_context, GLib.SourceFunc function, void* data);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static unowned GLib.TimeoutSource add_timeout (GLib.MainContext async_context, uint interval, GLib.SourceFunc function, void* data);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static unowned string base64_decode (string text, int out_len);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static int base64_decode_step (uchar[] @in, int len, uchar[] @out, int state, uint save);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static unowned string base64_encode (string text, int len);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static int base64_encode_close (uchar[] @in, int inlen, bool break_lines, uchar[] @out, int state, int save);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static int base64_encode_step (uchar[] @in, int len, bool break_lines, uchar[] @out, int state, int save);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static unowned string date_generate (ulong when);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static ulong date_iso8601_parse (string timestamp);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static ulong date_parse (string timestamp);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static void gmtime (ulong when, void* tm);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static unowned string header_param_copy_token (GLib.HashTable tokens, string t);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static unowned string header_param_decode_token (out unowned string @in);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static void header_param_destroy_hash (GLib.HashTable table);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static unowned GLib.HashTable header_param_parse_list (string header);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static bool headers_parse_request (string str, int len, GLib.HashTable dest, out unowned string req_method, out unowned string req_path, Soup.HttpVersion ver);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static bool headers_parse_response (string str, int len, GLib.HashTable dest, Soup.HttpVersion ver, uint status_code, out unowned string reason_phrase);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static bool headers_parse_status_line (string status_line, Soup.HttpVersion ver, uint status_code, out unowned string reason_phrase);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static Soup.MethodId method_get_id (string method);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static uint signal_connect_once (void* instance, string detailed_signal, GLib.Callback c_handler, void* data);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static unowned string status_get_phrase (uint status_code);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static bool str_case_equal (void* v1, void* v2);
	[CCode (cheader_filename = "libsoup/soup.h")]
	public static uint str_case_hash (void* key);
}
