abbr -a zbi 'zb info'
abbr -a zbI 'zb install'
abbr -a zbu 'zb update'
abbr -a zbU 'zb upgrade'
abbr -a zbr 'zb uninstall'
abbr -a zbc 'zb gc'

# >>> zerobrew >>>
# zerobrew
set -gx ZEROBREW_DIR "$XDG_CONFIG_HOME/zerobrew"
set -gx ZEROBREW_BIN "$HOME/.local/bin"
set -gx ZEROBREW_ROOT "$HOME/.local/zerobrew"
set -gx ZEROBREW_PREFIX "$HOME/.local/zerobrew/prefix"
if set -q PKG_CONFIG_PATH
    set -gx PKG_CONFIG_PATH "$ZEROBREW_PREFIX/lib/pkgconfig" $PKG_CONFIG_PATH
else
    set -gx PKG_CONFIG_PATH "$ZEROBREW_PREFIX/lib/pkgconfig"
end

# SSL/TLS certificates (only if ca-certificates is installed)
if not set -q CURL_CA_BUNDLE; or not set -q SSL_CERT_FILE
    if test -f "$ZEROBREW_PREFIX/opt/ca-certificates/share/ca-certificates/cacert.pem"
        set -q CURL_CA_BUNDLE; or set -gx CURL_CA_BUNDLE "$ZEROBREW_PREFIX/opt/ca-certificates/share/ca-certificates/cacert.pem"
        set -q SSL_CERT_FILE; or set -gx SSL_CERT_FILE "$ZEROBREW_PREFIX/opt/ca-certificates/share/ca-certificates/cacert.pem"
    else if test -f "$ZEROBREW_PREFIX/etc/ca-certificates/cacert.pem"
        set -q CURL_CA_BUNDLE; or set -gx CURL_CA_BUNDLE "$ZEROBREW_PREFIX/etc/ca-certificates/cacert.pem"
        set -q SSL_CERT_FILE; or set -gx SSL_CERT_FILE "$ZEROBREW_PREFIX/etc/ca-certificates/cacert.pem"
    else if test -f "$ZEROBREW_PREFIX/etc/openssl/cert.pem"
        set -q CURL_CA_BUNDLE; or set -gx CURL_CA_BUNDLE "$ZEROBREW_PREFIX/etc/openssl/cert.pem"
        set -q SSL_CERT_FILE; or set -gx SSL_CERT_FILE "$ZEROBREW_PREFIX/etc/openssl/cert.pem"
    else if test -f "$ZEROBREW_PREFIX/share/ca-certificates/cacert.pem"
        set -q CURL_CA_BUNDLE; or set -gx CURL_CA_BUNDLE "$ZEROBREW_PREFIX/share/ca-certificates/cacert.pem"
        set -q SSL_CERT_FILE; or set -gx SSL_CERT_FILE "$ZEROBREW_PREFIX/share/ca-certificates/cacert.pem"
    end
end

if not set -q SSL_CERT_DIR
    if test -d "$ZEROBREW_PREFIX/etc/ca-certificates"
        set -gx SSL_CERT_DIR "$ZEROBREW_PREFIX/etc/ca-certificates"
    else if test -d "$ZEROBREW_PREFIX/etc/openssl/certs"
        set -gx SSL_CERT_DIR "$ZEROBREW_PREFIX/etc/openssl/certs"
    else if test -d "$ZEROBREW_PREFIX/share/ca-certificates"
        set -gx SSL_CERT_DIR "$ZEROBREW_PREFIX/share/ca-certificates"
    end
end

if not contains -- "$ZEROBREW_BIN" $PATH
    set -gx PATH "$ZEROBREW_BIN" $PATH
end
if not contains -- "$ZEROBREW_PREFIX/bin" $PATH
    set -gx PATH "$ZEROBREW_PREFIX/bin" $PATH
end

# <<< zerobrew <<<

# Completion
# Generate used by `zb completion fish`
# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_zb_global_optspecs
	string join \n root= prefix= concurrency= auto-init v/verbose q/quiet h/help V/version
end

function __fish_zb_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_zb_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_zb_using_subcommand
	set -l cmd (__fish_zb_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c zb -n "__fish_zb_needs_command" -l root -d 'Path to zerobrew data directory' -r -F
complete -c zb -n "__fish_zb_needs_command" -l prefix -d 'Path to Homebrew-style prefix (overrides ZEROBREW_PREFIX)' -r -F
complete -c zb -n "__fish_zb_needs_command" -l concurrency -d 'Number of concurrent download threads' -r
complete -c zb -n "__fish_zb_needs_command" -l auto-init -d 'Automatically initialize without prompting'
complete -c zb -n "__fish_zb_needs_command" -s v -l verbose -d 'Increase output verbosity'
complete -c zb -n "__fish_zb_needs_command" -s q -l quiet -d 'Suppress output (only show errors)'
complete -c zb -n "__fish_zb_needs_command" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_needs_command" -s V -l version -d 'Print version'
complete -c zb -n "__fish_zb_needs_command" -f -a "install" -d 'Install formulas and casks'
complete -c zb -n "__fish_zb_needs_command" -f -a "bundle" -d 'Install or dump from a Brewfile'
complete -c zb -n "__fish_zb_needs_command" -f -a "uninstall" -d 'Uninstall formulas and casks'
complete -c zb -n "__fish_zb_needs_command" -f -a "migrate" -d 'Migrate packages from Homebrew'
complete -c zb -n "__fish_zb_needs_command" -f -a "list" -d 'List installed packages'
complete -c zb -n "__fish_zb_needs_command" -f -a "info" -d 'Show information about an installed package'
complete -c zb -n "__fish_zb_needs_command" -f -a "doctor" -d 'Run diagnostics and optionally repair issues'
complete -c zb -n "__fish_zb_needs_command" -f -a "gc" -d 'Remove unreferenced store entries'
complete -c zb -n "__fish_zb_needs_command" -f -a "reset" -d 'Reset zerobrew data directories'
complete -c zb -n "__fish_zb_needs_command" -f -a "init" -d 'Initialize zerobrew directories'
complete -c zb -n "__fish_zb_needs_command" -f -a "completion" -d 'Generate shell completions'
complete -c zb -n "__fish_zb_needs_command" -f -a "run" -d 'Run an installed formula as a command'
complete -c zb -n "__fish_zb_needs_command" -f -a "update" -d 'Refresh cached formula metadata'
complete -c zb -n "__fish_zb_needs_command" -f -a "outdated" -d 'List installed packages with newer versions available'
complete -c zb -n "__fish_zb_needs_command" -f -a "upgrade" -d 'Upgrade installed packages to the latest versions'
complete -c zb -n "__fish_zb_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c zb -n "__fish_zb_using_subcommand install" -l no-link -d 'Do not create symlinks after installation'
complete -c zb -n "__fish_zb_using_subcommand install" -s s -l build-from-source -d 'Build from source instead of using bottles'
complete -c zb -n "__fish_zb_using_subcommand install" -l auto-init -d 'Automatically initialize without prompting'
complete -c zb -n "__fish_zb_using_subcommand install" -s v -l verbose -d 'Increase output verbosity'
complete -c zb -n "__fish_zb_using_subcommand install" -s q -l quiet -d 'Suppress output (only show errors)'
complete -c zb -n "__fish_zb_using_subcommand install" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand bundle; and not __fish_seen_subcommand_from install dump help" -l auto-init -d 'Automatically initialize without prompting'
complete -c zb -n "__fish_zb_using_subcommand bundle; and not __fish_seen_subcommand_from install dump help" -s v -l verbose -d 'Increase output verbosity'
complete -c zb -n "__fish_zb_using_subcommand bundle; and not __fish_seen_subcommand_from install dump help" -s q -l quiet -d 'Suppress output (only show errors)'
complete -c zb -n "__fish_zb_using_subcommand bundle; and not __fish_seen_subcommand_from install dump help" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand bundle; and not __fish_seen_subcommand_from install dump help" -f -a "install" -d 'Install packages from a Brewfile'
complete -c zb -n "__fish_zb_using_subcommand bundle; and not __fish_seen_subcommand_from install dump help" -f -a "dump" -d 'Dump installed packages to a Brewfile'
complete -c zb -n "__fish_zb_using_subcommand bundle; and not __fish_seen_subcommand_from install dump help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from install" -s f -l file -d 'Path to the Brewfile' -r -F
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from install" -l no-link -d 'Do not create symlinks after installation'
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from install" -l auto-init -d 'Automatically initialize without prompting'
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from install" -s v -l verbose -d 'Increase output verbosity'
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from install" -s q -l quiet -d 'Suppress output (only show errors)'
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from install" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from dump" -s f -l file -d 'Output file path' -r -F
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from dump" -l force -d 'Overwrite existing file'
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from dump" -l auto-init -d 'Automatically initialize without prompting'
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from dump" -s v -l verbose -d 'Increase output verbosity'
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from dump" -s q -l quiet -d 'Suppress output (only show errors)'
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from dump" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from help" -f -a "install" -d 'Install packages from a Brewfile'
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from help" -f -a "dump" -d 'Dump installed packages to a Brewfile'
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c zb -n "__fish_zb_using_subcommand uninstall" -l all -d 'Uninstall all installed packages'
complete -c zb -n "__fish_zb_using_subcommand uninstall" -l auto-init -d 'Automatically initialize without prompting'
complete -c zb -n "__fish_zb_using_subcommand uninstall" -s v -l verbose -d 'Increase output verbosity'
complete -c zb -n "__fish_zb_using_subcommand uninstall" -s q -l quiet -d 'Suppress output (only show errors)'
complete -c zb -n "__fish_zb_using_subcommand uninstall" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand migrate" -s y -l yes -d 'Skip confirmation prompts'
complete -c zb -n "__fish_zb_using_subcommand migrate" -l force -d 'Force uninstall from Homebrew even if errors occur'
complete -c zb -n "__fish_zb_using_subcommand migrate" -l auto-init -d 'Automatically initialize without prompting'
complete -c zb -n "__fish_zb_using_subcommand migrate" -s v -l verbose -d 'Increase output verbosity'
complete -c zb -n "__fish_zb_using_subcommand migrate" -s q -l quiet -d 'Suppress output (only show errors)'
complete -c zb -n "__fish_zb_using_subcommand migrate" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand list" -l auto-init -d 'Automatically initialize without prompting'
complete -c zb -n "__fish_zb_using_subcommand list" -s v -l verbose -d 'Increase output verbosity'
complete -c zb -n "__fish_zb_using_subcommand list" -s q -l quiet -d 'Suppress output (only show errors)'
complete -c zb -n "__fish_zb_using_subcommand list" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand info" -l auto-init -d 'Automatically initialize without prompting'
complete -c zb -n "__fish_zb_using_subcommand info" -s v -l verbose -d 'Increase output verbosity'
complete -c zb -n "__fish_zb_using_subcommand info" -s q -l quiet -d 'Suppress output (only show errors)'
complete -c zb -n "__fish_zb_using_subcommand info" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand doctor" -l repair -d 'Automatically repair detected issues'
complete -c zb -n "__fish_zb_using_subcommand doctor" -l auto-init -d 'Automatically initialize without prompting'
complete -c zb -n "__fish_zb_using_subcommand doctor" -s v -l verbose -d 'Increase output verbosity'
complete -c zb -n "__fish_zb_using_subcommand doctor" -s q -l quiet -d 'Suppress output (only show errors)'
complete -c zb -n "__fish_zb_using_subcommand doctor" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand gc" -l auto-init -d 'Automatically initialize without prompting'
complete -c zb -n "__fish_zb_using_subcommand gc" -s v -l verbose -d 'Increase output verbosity'
complete -c zb -n "__fish_zb_using_subcommand gc" -s q -l quiet -d 'Suppress output (only show errors)'
complete -c zb -n "__fish_zb_using_subcommand gc" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand reset" -s y -l yes -d 'Skip confirmation prompts'
complete -c zb -n "__fish_zb_using_subcommand reset" -l auto-init -d 'Automatically initialize without prompting'
complete -c zb -n "__fish_zb_using_subcommand reset" -s v -l verbose -d 'Increase output verbosity'
complete -c zb -n "__fish_zb_using_subcommand reset" -s q -l quiet -d 'Suppress output (only show errors)'
complete -c zb -n "__fish_zb_using_subcommand reset" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand init" -l no-modify-path -d 'Do not modify shell configuration files'
complete -c zb -n "__fish_zb_using_subcommand init" -l auto-init -d 'Automatically initialize without prompting'
complete -c zb -n "__fish_zb_using_subcommand init" -s v -l verbose -d 'Increase output verbosity'
complete -c zb -n "__fish_zb_using_subcommand init" -s q -l quiet -d 'Suppress output (only show errors)'
complete -c zb -n "__fish_zb_using_subcommand init" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand completion" -l auto-init -d 'Automatically initialize without prompting'
complete -c zb -n "__fish_zb_using_subcommand completion" -s v -l verbose -d 'Increase output verbosity'
complete -c zb -n "__fish_zb_using_subcommand completion" -s q -l quiet -d 'Suppress output (only show errors)'
complete -c zb -n "__fish_zb_using_subcommand completion" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand run" -l auto-init -d 'Automatically initialize without prompting'
complete -c zb -n "__fish_zb_using_subcommand run" -s v -l verbose -d 'Increase output verbosity'
complete -c zb -n "__fish_zb_using_subcommand run" -s q -l quiet -d 'Suppress output (only show errors)'
complete -c zb -n "__fish_zb_using_subcommand run" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand update" -l auto-init -d 'Automatically initialize without prompting'
complete -c zb -n "__fish_zb_using_subcommand update" -s v -l verbose -d 'Increase output verbosity'
complete -c zb -n "__fish_zb_using_subcommand update" -s q -l quiet -d 'Suppress output (only show errors)'
complete -c zb -n "__fish_zb_using_subcommand update" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand outdated" -l json -d 'Output as JSON'
complete -c zb -n "__fish_zb_using_subcommand outdated" -l auto-init -d 'Automatically initialize without prompting'
complete -c zb -n "__fish_zb_using_subcommand outdated" -s v -l verbose -d 'Increase output verbosity'
complete -c zb -n "__fish_zb_using_subcommand outdated" -s q -l quiet -d 'Suppress output (only show errors)'
complete -c zb -n "__fish_zb_using_subcommand outdated" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand upgrade" -s s -l build-from-source -d 'Build from source instead of using bottles'
complete -c zb -n "__fish_zb_using_subcommand upgrade" -l no-link -d 'Do not create symlinks after installation'
complete -c zb -n "__fish_zb_using_subcommand upgrade" -l auto-init -d 'Automatically initialize without prompting'
complete -c zb -n "__fish_zb_using_subcommand upgrade" -s v -l verbose -d 'Increase output verbosity'
complete -c zb -n "__fish_zb_using_subcommand upgrade" -s q -l quiet -d 'Suppress output (only show errors)'
complete -c zb -n "__fish_zb_using_subcommand upgrade" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated upgrade help" -f -a "install" -d 'Install formulas and casks'
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated upgrade help" -f -a "bundle" -d 'Install or dump from a Brewfile'
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated upgrade help" -f -a "uninstall" -d 'Uninstall formulas and casks'
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated upgrade help" -f -a "migrate" -d 'Migrate packages from Homebrew'
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated upgrade help" -f -a "list" -d 'List installed packages'
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated upgrade help" -f -a "info" -d 'Show information about an installed package'
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated upgrade help" -f -a "doctor" -d 'Run diagnostics and optionally repair issues'
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated upgrade help" -f -a "gc" -d 'Remove unreferenced store entries'
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated upgrade help" -f -a "reset" -d 'Reset zerobrew data directories'
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated upgrade help" -f -a "init" -d 'Initialize zerobrew directories'
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated upgrade help" -f -a "completion" -d 'Generate shell completions'
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated upgrade help" -f -a "run" -d 'Run an installed formula as a command'
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated upgrade help" -f -a "update" -d 'Refresh cached formula metadata'
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated upgrade help" -f -a "outdated" -d 'List installed packages with newer versions available'
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated upgrade help" -f -a "upgrade" -d 'Upgrade installed packages to the latest versions'
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated upgrade help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c zb -n "__fish_zb_using_subcommand help; and __fish_seen_subcommand_from bundle" -f -a "install" -d 'Install packages from a Brewfile'
complete -c zb -n "__fish_zb_using_subcommand help; and __fish_seen_subcommand_from bundle" -f -a "dump" -d 'Dump installed packages to a Brewfile'
