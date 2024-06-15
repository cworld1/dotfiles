# Rust
set -gx CARGO_HOME "$XDG_DATA_HOME"/cargo
set -gx RUSTUP_HOME "$XDG_DATA_HOME"/rustup


if [ -f "$XDG_DATA_HOME"/cargo/env.fish ]
    source "$XDG_DATA_HOME"/cargo/env.fish
