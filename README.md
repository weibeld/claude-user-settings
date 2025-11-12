# Claude Code User Settings

This repository maintains customised [Claude Code user settings](https://code.claude.com/docs/en/settings).

> The Claude Code user settings are the files in in `$HOME/.claude`.

## Usage

This repository is supposed to be used as a [bare repository](https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---bare).

> **Note:** a bare Git repository is a repository that doesn't have an implicit working tree directory. Instead, the working tree must be specified for each command with the [`--work-tree`](https://git-scm.com/docs/git#Documentation/git.txt---work-treepath) option.

### 1. Clone

Clone the repo as a bare repository anywhere on your system:

```bash
git clone --bare https://github.com/weibeld/claude-user-settings
```

### 2. Check out files

Check out the files in the repo to `$HOME/.claude`:

```bash
cd claude-user-settings.git
git --work-tree ~/.claude checkout
```

> ⚠️ **Caution:** this overwrites your locally saved versions of these files.

### 3. Track changes 

Track your local changes to the files in the repository and push them back to GitHub. For example:

```bash
cd claude-user-settings.git
git --work-tree ~/.claude status
git --work-tree ~/.claude add settings.json
git --work-tree ~/.claude commit
git --work-tree ~/.claude push
```

### Tips

You may set the `GIT_WORK_TREE` environment variable to avoid using the `--work-tree` option for every command:

```bash
export GIT_WORK_TREE=~/.claude
```

Alternatively, you can also define an alias:

```bash
alias gitclaude='git --work-tree ~/.claude'
```

You may additionally set `GIT_DIR` and [`--git-dir`](https://git-scm.com/docs/git#Documentation/git.txt---git-dirpath) to the repository directory to avoid the need to execute the commands from within the repository directory. For example, if you cloned the repository to `~/claude-user-settings.git`:

```bash
git --work-tree ~/.claude --git-dir ~/claude-user-settings.git status
```

If using an alias:

``` bash
alias gitclaude='git --work-tree ~/.claude --git-dir ~/claude-user-settings.git'
```

Or if using environment variables:

```bash
export GIT_WORK_TREE=~/.claude
export GIT_DIR=~/claude-user-settings.git
```

You can then execute the commands from anywhere on the file system.

## References

- [Claude Code Settings](https://code.claude.com/docs/en/settings)
- [Status Line Configuration](https://code.claude.com/docs/en/statusline)
