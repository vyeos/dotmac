#!/bin/zsh
# Install Ollama - https://ollama.com/download/Ollama.dmg

pipx install poetry

ollama run llama3

git clone https://github.com/vyeos/apeiron
cd apeiron
# python3 -m venv venv
# source venv/bin/activate
# pip3 install -r requirements.txt

ollama run llava


