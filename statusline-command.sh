# Read JSON input from stdin
# Tip: temporarily use `echo "$input" >file` to see available data
input=$(cat)

session=$(echo "$input" | jq -r ".session_id" | cut -c 1-4)
model=$(echo "$input" | jq -r ".model.display_name")
cwd=$(echo "$input" | jq -r ".workspace.current_dir")

# Check if we're in a git repository and get branch info
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
  branch=$(git -C "$cwd" -c core.useReplaceRefs=false -c gc.auto=0 branch --show-current 2>/dev/null)
  if [[ -z "$branch" ]]; then
    branch="(detached)"
  fi
fi

session_str="🫆 [$session] "
model_str="🧠 [$model] "
cwd_str="📁 [$(echo "$cwd" | sed "s#$HOME#~#")] "
if [[ -n "$branch" ]]; then
  git_str="🐙 [$branch] "
else
  unset git_str
fi

# Print formatted status line with orange background
printf "\033[48;5;214m\033[30m Claude %s%s%s%s\033[0m" "$session_str" "$model_str" "$cwd_str" "$git_str"
