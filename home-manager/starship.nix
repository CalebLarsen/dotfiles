{ config, pkgs, ... }:
let
  c = config.florumbra.colors;

  starshipToml = pkgs.writeText "starship.toml" ''
    command_timeout = 500
    add_newline = false

    palette = 'florumbra'
    format = """
    [](pink)\
    $directory\
    [](fg:pink bg:green)\
    $git_branch\
    $git_status\
    [](fg:green bg:dark-gray)\
    $c$crystal$golang$haskell$java''${custom.javascript}$lua$python$ruby$rust''${custom.scheme}$zig\
    [](fg:dark-gray bg:black)\
    $status \
    """

    [directory]
    style = "bg:pink fg:darkest-gray"
    format = "[ $path ]($style)"
    truncation_length = 3
    truncation_symbol = "…/"

    [git_branch]
    style = "bg:green fg:dark-gray"
    format = '[ $symbol$branch]($style)'

    [git_status]
    style = "bg:green fg:dark-gray"
    format = '[( $all_status$ahead_behind )]($style)'

    [status]
    disabled = false
    style = "bold bg:black fg:red"
    format = '[$symbol]($style)'

    # Languages
    [c]
    format = '[ $symbol ]($style)'
    symbol = ' '
    style = "bg:dark-gray fg:light-gray"

    [crystal]
    format = '[ $symbol ]($style)'
    symbol = ' '
    style = "bg:dark-gray fg:light-gray"

    [golang]
    format = '[ $symbol ]($style)'
    symbol = ' '
    style = "bg:dark-gray fg:light-gray"

    [haskell]
    format = '[ $symbol ]($style)'
    symbol = ' '
    style = "bg:dark-gray fg:light-gray"

    [java]
    format = '[ $symbol ]($style)'
    symbol = ' '
    style = "bg:dark-gray fg:light-gray"

    [custom.javascript]
    detect_extensions = ['js']
    format = '[ $symbol ]($style)'
    symbol = ' '
    style = "bg:dark-gray fg:light-gray"

    [lua]
    format = '[ $symbol ]($style)'
    symbol = ' '
    style = "bg:dark-gray fg:light-gray"

    [python]
    format = '[ $symbol$pyenv_prefix(\($virtualenv\)) ]($style)'
    symbol = ' '
    style = "bg:dark-gray fg:light-gray"

    [ruby]
    format = '[ $symbol ]($style)'
    symbol = ' '
    style = "bg:dark-gray fg:light-gray"

    [rust]
    format = '[ $symbol ]($style)'
    symbol = ' '
    style = "bg:dark-gray fg:light-gray"

    [custom.scheme]
    detect_extensions = ['scm']
    format = '[ $symbol ]($style)'
    symbol = ' '
    style = "bg:dark-gray fg:light-gray"

    [zig]
    format = '[ $symbol ]($style)'
    symbol = ' '
    style = "bg:dark-gray fg:light-gray"

    [time]
    disabled = false
    use_12hr = true

    [palettes.florumbra]
    white        = "${c.white}"
    light-gray   = "${c.lightGray}"
    gray         = "${c.gray}"
    dark-gray    = "${c.darkGray}"
    darkest-gray = "${c.darkestGray}"
    black        = "#000000"
    pink         = "${c.pink}"
    orange       = "${c.orange}"
    yellow       = "${c.yellow}"
    green        = "${c.green}"
    light-blue   = "${c.lightBlue}"
    purple       = "${c.purple}"
  '';
in {
  programs.starship.enable = true;
  home.file.".config/starship.toml".source = starshipToml;
}

