#!/bin/bash
# Install Ollama - https://ollama.com/download/Ollama.dmg

pipx install poetry

ollama run llama3

git clone https://github.com/vyeos/apeiron
cd apeiron
poetry install

ollama run llava & 

./run.sh
