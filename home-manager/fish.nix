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
    LS_COLORS = "di=01;34:ln=01;38;2;102;217;239:pi=40;38;2;230;219;116:so=01;38;2;174;129;255:do=01;38;2;174;129;255:bd=40;38;2;230;219;116;01:cd=40;38;2;230;219;116;01:or=40;01;02;38;2;249;38;114:ex=01;32:*.p8=01;38;2;166;226;46:*.rom=01;38;2;166;226;46:*.tar=01;01;02;38;2;249;38;114:*.tgz=01;01;02;38;2;249;38;114:*.arc=01;01;02;38;2;249;38;114:*.arj=01;01;02;38;2;249;38;114:*.taz=01;01;02;38;2;249;38;114:*.lha=01;01;02;38;2;249;38;114:*.lz4=01;01;02;38;2;249;38;114:*.lzh=01;01;02;38;2;249;38;114:*.lzma=01;01;02;38;2;249;38;114:*.tlz=01;01;02;38;2;249;38;114:*.txz=01;01;02;38;2;249;38;114:*.tzo=01;01;02;38;2;249;38;114:*.t7z=01;01;02;38;2;249;38;114:*.zip=01;01;02;38;2;249;38;114:*.iso=01;01;02;38;2;249;38;114:*.z=01;01;02;38;2;249;38;114:*.dz=01;01;02;38;2;249;38;114:*.gz=01;01;02;38;2;249;38;114:*.lrz=01;01;02;38;2;249;38;114:*.lz=01;01;02;38;2;249;38;114:*.lzo=01;01;02;38;2;249;38;114:*.xz=01;01;02;38;2;249;38;114:*.zst=01;01;02;38;2;249;38;114:*.tzst=01;01;02;38;2;249;38;114:*.bz2=01;01;02;38;2;249;38;114:*.bz=01;01;02;38;2;249;38;114:*.tbz=01;01;02;38;2;249;38;114:*.tbz2=01;01;02;38;2;249;38;114:*.tz=01;01;02;38;2;249;38;114:*.deb=01;01;02;38;2;249;38;114:*.rpm=01;01;02;38;2;249;38;114:*.jar=01;01;02;38;2;249;38;114:*.war=01;01;02;38;2;249;38;114:*.ear=01;01;02;38;2;249;38;114:*.sar=01;01;02;38;2;249;38;114:*.rar=01;01;02;38;2;249;38;114:*.alz=01;01;02;38;2;249;38;114:*.ace=01;01;02;38;2;249;38;114:*.zoo=01;01;02;38;2;249;38;114:*.cpio=01;01;02;38;2;249;38;114:*.7z=01;01;02;38;2;249;38;114:*.rz=01;01;02;38;2;249;38;114:*.cab=01;01;02;38;2;249;38;114:*.wim=01;01;02;38;2;249;38;114:*.swm=01;01;02;38;2;249;38;114:*.dwm=01;01;02;38;2;249;38;114:*.esd=01;01;02;38;2;249;38;114:*.jpg=01;38;2;174;129;255:*.jpeg=01;38;2;174;129;255:*.mjpg=01;38;2;174;129;255:*.mjpeg=01;38;2;174;129;255:*.gif=01;38;2;174;129;255:*.bmp=01;38;2;174;129;255:*.pbm=01;38;2;174;129;255:*.pgm=01;38;2;174;129;255:*.ppm=01;38;2;174;129;255:*.tga=01;38;2;174;129;255:*.xbm=01;38;2;174;129;255:*.xpm=01;38;2;174;129;255:*.tif=01;38;2;174;129;255:*.tiff=01;38;2;174;129;255:*.png=01;38;2;174;129;255:*.svg=01;38;2;174;129;255:*.svgz=01;38;2;174;129;255:*.mng=01;38;2;174;129;255:*.pcx=01;38;2;174;129;255:*.mov=01;38;2;174;129;255:*.mpg=01;38;2;174;129;255:*.mpeg=01;38;2;174;129;255:*.m2v=01;38;2;174;129;255:*.mkv=01;38;2;174;129;255:*.webm=01;38;2;174;129;255:*.ogm=01;38;2;174;129;255:*.mp4=01;38;2;174;129;255:*.m4v=01;38;2;174;129;255:*.mp4v=01;38;2;174;129;255:*.vob=01;38;2;174;129;255:*.qt=01;38;2;174;129;255:*.nuv=01;38;2;174;129;255:*.wmv=01;38;2;174;129;255:*.asf=01;38;2;174;129;255:*.rm=01;38;2;174;129;255:*.rmvb=01;38;2;174;129;255:*.flc=01;38;2;174;129;255:*.avi=01;38;2;174;129;255:*.fli=01;38;2;174;129;255:*.flv=01;38;2;174;129;255:*.gl=01;38;2;174;129;255:*.dl=01;38;2;174;129;255:*.xcf=01;38;2;174;129;255:*.xwd=01;38;2;174;129;255:*.yuv=01;38;2;174;129;255:*.cgm=01;38;2;174;129;255:*.emf=01;38;2;174;129;255:*.ogv=01;38;2;174;129;255:*.ogx=01;38;2;174;129;255:*.aac=00;38;2;102;217;239:*.au=00;38;2;102;217;239:*.flac=00;38;2;102;217;239:*.m4a=00;38;2;102;217;239:*.mid=00;38;2;102;217;239:*.midi=00;38;2;102;217;239:*.mka=00;38;2;102;217;239:*.mp3=00;38;2;102;217;239:*.mpc=00;38;2;102;217;239:*.ogg=00;38;2;102;217;239:*.ra=00;38;2;102;217;239:*.wav=00;38;2;102;217;239:*.oga=00;38;2;102;217;239:*.opus=00;38;2;102;217;239:*.spx=00;38;2;102;217;239:*.xspf=00;38;2;102;217;239:*.md=00;38;2;102;217;239:*.toml=00;38;2;102;217;239:*.yaml=00;38;2;102;217;239";
    EZA_COLORS = "uu=01;38;2;166;226;46:sc=37:bu=01;37:cm=38;2;253;151;31:do=38;2;230;219;116:da=38;2;102;217;239";
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
      senv = "hms";
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
      hx-rel = ''
        pushd $(pwd)
        cd ~/projects/opensource/helix
        cargo build --release
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
        function add_path_if_exists -d "Adds a directory to \$PATH if it exists"
            if test -d $argv
                fish_add_path $argv
            end
        end
        add_path_if_exists /usr/local/bin
        add_path_if_exists /usr/bin
        add_path_if_exists $HOME/.local/bin
        add_path_if_exists $HOME/bin # installed tools
        add_path_if_exists $HOME/roms # uxn
        add_path_if_exists $HOME/.cargo/bin # rust
        add_path_if_exists /usr/local/go/bin # go
        add_path_if_exists $HOME/.cabal/bin # haskell
        add_path_if_exists $HOME/.ghcup/bin # haskell
        add_path_if_exists /opt/homebrew/bin # homebrew
        add_path_if_exists $HOME/.elan/bin # lean

        if test -d /opt/homebrew
            alias find gfind
        end

        zoxide init fish --no-cmd | source
        starship init fish | source
        enable_transience
      '';
     };

}

