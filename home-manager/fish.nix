{ config, pkgs, ... }:

{
  home.sessionVariables = {
    EDITOR = "hx";
    SITE_ROOT = "${config.home.homeDirectory}/projects/caleb-trade/site";
    PAGER = "bat -p --paging=always";
    MANROFFOPT = "-c";
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
    XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
    XDG_CACHE_HOME = "${config.home.homeDirectory}/.cache";
    COLORTERM = "truecolor";
    fish_greeting = "";
    HELIX_RUNTIME = "${config.home.homeDirectory}/projects/opensource/helix/runtime";
    HOMEBREW_NO_ENV_HINTS = "true";
  };
  home.sessionVariables.HOME_MANAGER_CONFIG = "flake:/Users/caleb/projects/dotfiles";
  
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza --icons";
      fishrc = "$EDITOR ~/projects/dotfiles/home-manager/fish.nix";
      cat = "bat -p";
      du = "dust";
      love = "/Applications/love.app/Contents/MacOS/love";
      hms = "nix run ~/projects/dotfiles#home-manager -- --flake ~/projects/dotfiles switch";
      senv = "hms && source ~/.config/fish/config.fish && exec fish -l";
    };
    functions = {
      hx-update = ''
        pushd $(pwd)
        cd ~/projects/opensource/helix
        git checkout master
        git fetch upstream
        git merge upstream/master
        if test $status -ne 0
            popd
            return
        end
        git push
        cargo install --path "$HELIX_RUNTIME/../helix-term" --locked
        popd
      '';
      hx-dev = ''
        pushd $(pwd)
        cd ~/projects/opensource/helix
        git checkout master
        nix develop --command bash -c 'cargo build'
        if test $status -ne 0
            popd
            return 1
        end
        popd
        ~/projects/opensource/helix/target/release/hx --config ~/projects/opensource/helix/config.toml $argv
      '';
      hx-rel = ''
        pushd $(pwd)
        cd ~/projects/opensource/helix
        git checkout master
        nix develop --command bash -c 'cargo build --release'
        if test $status -ne 0
            popd
            return 1
        end
        popd
        ~/projects/opensource/helix/target/release/hx --config ~/projects/opensource/helix/config.toml $argv
      '';
      start-issue = ''
        cd ~/projects/opensource/helix

        set issue_id $argv[1]

        if test -z "$issue_id"
            echo "Usage: start-issue <issue-number>"
            return 1
        end

        set issue_json (gh issue view $issue_id --repo helix-editor/helix --json title,url,createdAt --jq '.')
        set title (echo $issue_json | jq -r '.title')
        set url (echo $issue_json | jq -r '.url')
        set created (echo $issue_json | jq -r '.createdAt')
        set created_local (date -j -f "%Y-%m-%dT%H:%M:%SZ" $created "+%F %H:%M")

        set raw_slug (string lower $title)
        set raw_slug (string replace -ra '[^\w\s-]' "" -- $raw_slug)
        set raw_slug (string replace -ra '[\s+]' '-' -- $raw_slug)
        set raw_slug (string replace -ra "\-+" '-' -- $raw_slug)
        set raw_slug (string trim --chars=- $raw_slug)

        set slug (string sub -l 20 $raw_slug)
        set slug (string split -m 4 - $slug | string join -)
        set slug (string replace -ra "\-+" '-' -- $slug)
        set slug (string trim --chars=- $slug)
        set branch "$slug-$issue_id"

        git switch -C $branch

        set notes_file "notes/$issue_id.md"
        mkdir -p notes

        echo "# $title [$issue_id]($url)" >$notes_file
        echo "Created: $created" >>$notes_file
        echo "Started: $(date "+%F %H:%M") local" >>$notes_file
        echo "" >>$notes_file

        # Kitty
        kitty @ launch --type=tab --tab-title="notes: $issue_id" --cwd ~/projects/opensource/helix --dont-take-focus hx $notes_file +5
        kitty @ launch --type=tab --tab-title="shell: $issue_id" --cwd ~/projects/opensource/helix --dont-take-focus
        kitty @ set-tab-title "helix: $issue_id"
        clear
        hx .
      ''; 
      gadd = "git add -up";
      gc = "git-cz --disable-emoji";
      gclean = ''
        set protected_branches master main dev
        set deleted false

        echo "Fetching branches"
        git fetch --prune
        git fetch origin --prune
        set merged_branches (git branch --format="%(refname:short)" --merged upstream/master | grep -vE '^\*|master|main|dev')

        echo "Checking for merged PR branches"
        set remote_heads (git ls-remote --heads origin | awk '{print $2}' | string replace 'refs/heads/' "")
        set remote_prs (gh pr list --repo helix-editor/helix --state merged --limit 100 --json headRefName --jq '.[].headRefName')

        for branch in $remote_prs
            if contains $branch $protected_branches
                continue
            end
            if contains $branch $remote_heads
                echo "Deleting remote branch: $branch"
                git push origin --delete $branch
                set deleted true
            end
            if git rev-parse --verify $branch >/dev/null 2>/dev/null
                echo "Deleting local branch: $branch"
                git branch -D $branch
                echo ""
                set deleted true
            end
        end
        if test "$deleted" = false
            echo "Nothing to be done"
        end
      '';
      z = ''
        __zoxide_z $argv
        if test $status -eq 0
            ls
        end
      '';
      };
      interactiveShellInit = ''

        if test -d /opt/homebrew
            alias find gfind
        end
        
        set -x RUSTFLAGS "--cfg tokio_unstable"
        set -x RUSTFLAGS $RUSTFLAGS -L$(brew --prefix libiconv)/lib
        set -x RUSTDOCFLAGS $RUSTFLAGS
        zoxide init fish --no-cmd | source
        starship init fish | source
        enable_transience
      '';
     };

}

