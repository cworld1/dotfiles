alias zbi 'zb info'
alias zbI 'zb install'
alias zbu 'zb update'
alias zbU 'zb upgrade'
alias zbr 'zb uninstall'
alias zbc 'zb gc'

# >>> zerobrew >>>
# zerobrew
set -gx ZEROBREW_DIR "$XDG_CONFIG_HOME/.local/zerobrew"
set -gx ZEROBREW_BIN "$XDG_CONFIG_HOME/.local/zerobrew/bin"
set -gx ZEROBREW_ROOT "$XDG_DATA_HOME/zerobrew"
set -gx ZEROBREW_PREFIX "$XDG_DATA_HOME/zerobrew/prefix"
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

complete -c zb -n "__fish_zb_needs_command" -l root -r -F
complete -c zb -n "__fish_zb_needs_command" -l prefix -r -F
complete -c zb -n "__fish_zb_needs_command" -l concurrency -r
complete -c zb -n "__fish_zb_needs_command" -l auto-init
complete -c zb -n "__fish_zb_needs_command" -s v -l verbose
complete -c zb -n "__fish_zb_needs_command" -s q -l quiet
complete -c zb -n "__fish_zb_needs_command" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_needs_command" -s V -l version -d 'Print version'
complete -c zb -n "__fish_zb_needs_command" -f -a "install"
complete -c zb -n "__fish_zb_needs_command" -f -a "bundle"
complete -c zb -n "__fish_zb_needs_command" -f -a "uninstall"
complete -c zb -n "__fish_zb_needs_command" -f -a "migrate"
complete -c zb -n "__fish_zb_needs_command" -f -a "list"
complete -c zb -n "__fish_zb_needs_command" -f -a "info"
complete -c zb -n "__fish_zb_needs_command" -f -a "doctor"
complete -c zb -n "__fish_zb_needs_command" -f -a "gc"
complete -c zb -n "__fish_zb_needs_command" -f -a "reset"
complete -c zb -n "__fish_zb_needs_command" -f -a "init"
complete -c zb -n "__fish_zb_needs_command" -f -a "completion"
complete -c zb -n "__fish_zb_needs_command" -f -a "run"
complete -c zb -n "__fish_zb_needs_command" -f -a "update"
complete -c zb -n "__fish_zb_needs_command" -f -a "outdated"
complete -c zb -n "__fish_zb_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c zb -n "__fish_zb_using_subcommand install" -l no-link
complete -c zb -n "__fish_zb_using_subcommand install" -s s -l build-from-source
complete -c zb -n "__fish_zb_using_subcommand install" -l auto-init
complete -c zb -n "__fish_zb_using_subcommand install" -s v -l verbose
complete -c zb -n "__fish_zb_using_subcommand install" -s q -l quiet
complete -c zb -n "__fish_zb_using_subcommand install" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand bundle; and not __fish_seen_subcommand_from install dump help" -l auto-init
complete -c zb -n "__fish_zb_using_subcommand bundle; and not __fish_seen_subcommand_from install dump help" -s v -l verbose
complete -c zb -n "__fish_zb_using_subcommand bundle; and not __fish_seen_subcommand_from install dump help" -s q -l quiet
complete -c zb -n "__fish_zb_using_subcommand bundle; and not __fish_seen_subcommand_from install dump help" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand bundle; and not __fish_seen_subcommand_from install dump help" -f -a "install"
complete -c zb -n "__fish_zb_using_subcommand bundle; and not __fish_seen_subcommand_from install dump help" -f -a "dump"
complete -c zb -n "__fish_zb_using_subcommand bundle; and not __fish_seen_subcommand_from install dump help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from install" -s f -l file -r -F
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from install" -l no-link
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from install" -l auto-init
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from install" -s v -l verbose
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from install" -s q -l quiet
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from install" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from dump" -s f -l file -r -F
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from dump" -l force
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from dump" -l auto-init
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from dump" -s v -l verbose
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from dump" -s q -l quiet
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from dump" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from help" -f -a "install"
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from help" -f -a "dump"
complete -c zb -n "__fish_zb_using_subcommand bundle; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c zb -n "__fish_zb_using_subcommand uninstall" -l all
complete -c zb -n "__fish_zb_using_subcommand uninstall" -l auto-init
complete -c zb -n "__fish_zb_using_subcommand uninstall" -s v -l verbose
complete -c zb -n "__fish_zb_using_subcommand uninstall" -s q -l quiet
complete -c zb -n "__fish_zb_using_subcommand uninstall" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand migrate" -s y -l yes
complete -c zb -n "__fish_zb_using_subcommand migrate" -l force
complete -c zb -n "__fish_zb_using_subcommand migrate" -l auto-init
complete -c zb -n "__fish_zb_using_subcommand migrate" -s v -l verbose
complete -c zb -n "__fish_zb_using_subcommand migrate" -s q -l quiet
complete -c zb -n "__fish_zb_using_subcommand migrate" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand list" -l auto-init
complete -c zb -n "__fish_zb_using_subcommand list" -s v -l verbose
complete -c zb -n "__fish_zb_using_subcommand list" -s q -l quiet
complete -c zb -n "__fish_zb_using_subcommand list" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand info" -l auto-init
complete -c zb -n "__fish_zb_using_subcommand info" -s v -l verbose
complete -c zb -n "__fish_zb_using_subcommand info" -s q -l quiet
complete -c zb -n "__fish_zb_using_subcommand info" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand doctor" -l repair
complete -c zb -n "__fish_zb_using_subcommand doctor" -l auto-init
complete -c zb -n "__fish_zb_using_subcommand doctor" -s v -l verbose
complete -c zb -n "__fish_zb_using_subcommand doctor" -s q -l quiet
complete -c zb -n "__fish_zb_using_subcommand doctor" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand gc" -l auto-init
complete -c zb -n "__fish_zb_using_subcommand gc" -s v -l verbose
complete -c zb -n "__fish_zb_using_subcommand gc" -s q -l quiet
complete -c zb -n "__fish_zb_using_subcommand gc" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand reset" -s y -l yes
complete -c zb -n "__fish_zb_using_subcommand reset" -l auto-init
complete -c zb -n "__fish_zb_using_subcommand reset" -s v -l verbose
complete -c zb -n "__fish_zb_using_subcommand reset" -s q -l quiet
complete -c zb -n "__fish_zb_using_subcommand reset" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand init" -l no-modify-path
complete -c zb -n "__fish_zb_using_subcommand init" -l auto-init
complete -c zb -n "__fish_zb_using_subcommand init" -s v -l verbose
complete -c zb -n "__fish_zb_using_subcommand init" -s q -l quiet
complete -c zb -n "__fish_zb_using_subcommand init" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand completion" -l auto-init
complete -c zb -n "__fish_zb_using_subcommand completion" -s v -l verbose
complete -c zb -n "__fish_zb_using_subcommand completion" -s q -l quiet
complete -c zb -n "__fish_zb_using_subcommand completion" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand run" -l auto-init
complete -c zb -n "__fish_zb_using_subcommand run" -s v -l verbose
complete -c zb -n "__fish_zb_using_subcommand run" -s q -l quiet
complete -c zb -n "__fish_zb_using_subcommand update" -l auto-init
complete -c zb -n "__fish_zb_using_subcommand update" -s v -l verbose
complete -c zb -n "__fish_zb_using_subcommand update" -s q -l quiet
complete -c zb -n "__fish_zb_using_subcommand update" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand outdated" -l json -d 'Output as JSON'
complete -c zb -n "__fish_zb_using_subcommand outdated" -l auto-init
complete -c zb -n "__fish_zb_using_subcommand outdated" -s v -l verbose
complete -c zb -n "__fish_zb_using_subcommand outdated" -s q -l quiet
complete -c zb -n "__fish_zb_using_subcommand outdated" -s h -l help -d 'Print help'
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated help" -f -a "install"
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated help" -f -a "bundle"
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated help" -f -a "uninstall"
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated help" -f -a "migrate"
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated help" -f -a "list"
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated help" -f -a "info"
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated help" -f -a "doctor"
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated help" -f -a "gc"
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated help" -f -a "reset"
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated help" -f -a "init"
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated help" -f -a "completion"
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated help" -f -a "run"
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated help" -f -a "update"
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated help" -f -a "outdated"
complete -c zb -n "__fish_zb_using_subcommand help; and not __fish_seen_subcommand_from install bundle uninstall migrate list info doctor gc reset init completion run update outdated help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c zb -n "__fish_zb_using_subcommand help; and __fish_seen_subcommand_from bundle" -f -a "install"
complete -c zb -n "__fish_zb_using_subcommand help; and __fish_seen_subcommand_from bundle" -f -a "dump"
