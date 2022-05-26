#!/bin/bash
curl -s https://raw.githubusercontent.com/f5nodes/logo/main/logo-shark.sh | bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup update stable
rustc -V
cd ~/pathfinder
git fetch
git checkout v0.1.11-alpha
cargo build --release --bin pathfinder
mv ~/pathfinder/target/release/pathfinder /usr/local/bin/
cd py
source .venv/bin/activate
PIP_REQUIRE_VIRTUALENV=true pip install -r requirements-dev.txt
systemctl restart starknetd
pathfinder -V