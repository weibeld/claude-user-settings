#!/usr/bin/env bash

input=$(cat)
dir=$(echo "$input" | jq -r '.workspace.current_dir')
session=$(echo "$input" | jq -r '.session_id' | cut -c1-8)
context=$(printf '%.0f' "$(echo "$input" | jq -r '.context_window.used_percentage // 0')")%
echo "${dir} | ${session} | ${context}"
