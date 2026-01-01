curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

rustup toolchain install stable
rustup target add wasm32-unknown-unknown
curl -sSL https://dioxus.dev/install.sh | bash

rustup target add aarch64-apple-ios aarch64-apple-ios-sim
