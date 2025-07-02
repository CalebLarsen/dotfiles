{ pkgs, ...}:

{
  programs.git = {
    enable = true;

    userName = "Caleb Larsen";
    userEmail = "caleb.john.larsen@gmail.com";

    extraConfig = {
      pull.rebase = true;
      merge.conflictstyle = "diff3";
      push.autoSetupRemote = true;
      init.defaultBranch = "main";
      commit.verbose = true;
      rerere.enabled = true;
      help.autocorrect = 10;
      core = {
        editor = "hx";
        attributesfile = "~/.gitattributes";
      };
      diff.algorithm = "histogram";
      transfer.fsckObjects = true;
      fetch.fsckObjects = true;
      receive.fsckObjects = true;
      branch.sort = "-committerdate";
      interactive.diffFilter = "delta --color-only";
      color.ui = true;

      delta = {
        navigate = true;
        line-numbers = true;
        syntax-theme = "OneHalfDark";
        side-by-side = true;
      };
      "url \"git@github.com:\"" = {
        insteadOf = "https://github.com/";
      };
      "merge \"mergiraf\"" = {
        name = "mergiraf";
        driver = "mergiraf merge --git %O %A %B -s %S -x %X -y %Y -p %P -l %L";
      };
    };
  };
  home.file.".gitattributes".text = ''
    * merge=mergiraf
  '';
}
