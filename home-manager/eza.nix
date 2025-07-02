{ config, pkgs, ... }:

let
  c = config.florumbra.colors;

  ezaTheme = pkgs.writeText "florumbra-eza-theme.yml" ''
    colourful: true

    filekinds:
      normal: { foreground: "${c.softWhite}" }
      directory: { foreground: "${c.orange}" }
      symlink: { foreground: "${c.purple}" }
      executable: { foreground: "${c.green}" }
      pipe: { foreground: "${c.lightGray}" }
      socket: { foreground: "${c.lightGray}" }
      block_device: { foreground: "${c.lightOrange}" }
      char_device: { foreground: "${c.lightOrange}" }
      special: { foreground: "${c.pink}" }

    perms:
      user_read: { foreground: "${c.lightBlue}" }
      user_write: { foreground: "${c.orange}" }
      user_execute_file: { foreground: "${c.green}" }
      user_execute_other: { foreground: "${c.green}" }
      group_read: { foreground: "${c.lightBlue}" }
      group_write: { foreground: "${c.orange}" }
      group_execute: { foreground: "${c.green}" }
      other_read: { foreground: "${c.lightBlue}" }
      other_write: { foreground: "${c.orange}" }
      other_execute: { foreground: "${c.green}" }

    users:
      user_you: { foreground: "${c.pink}" }
      user_root: { foreground: "${c.white}" }
      user_other: { foreground: "${c.lightGray}" }
      group_yours: { foreground: "${c.pink}" }
      group_other: { foreground: "${c.lightGray}" }
      group_root: { foreground: "${c.white}" }

    file_type:
      image: { foreground: "${c.purple}" }
      video: { foreground: "${c.purple}" }
      music: { foreground: "${c.purple}" }
      crypto: { foreground: "${c.lightGray}" }
      document: { foreground: "${c.lightBlue}" }
      compressed: { foreground: "${c.purple}" }
      temp: { foreground: "${c.lightOrange}" }
      compiled: { foreground: "${c.lightBlue}" }
      build: { foreground: "${c.lightGreen}" }
      source: { foreground: "${c.teal}" }

    punctuation: { foreground: "${c.lightGray}" }
    date: { foreground: "${c.yellow}" }
    inode: { foreground: "${c.lightGray}" }
    blocks: { foreground: "${c.lightGray}" }
    header: { foreground: "${c.softWhite}" }
    octal: { foreground: "${c.lightBlue}" }
    flags: { foreground: "${c.purple}" }

    symlink_path: { foreground: "${c.purple}" }
    control_char: { foreground: "${c.lightBlue}" }
    broken_symlink: { foreground: "${c.pink}" }
    broken_path_overlay: { foreground: "${c.lightGray}" }

    extensions:
      md:
        filename:
          foreground: "${c.lightBlue}"
        icon:
          style:
            foreground: "${c.lightBlue}"
      toml:
        filename:
          foreground: "${c.lightBlue}"
        icon:
          style:
            foreground: "${c.lightBlue}"
  '';
in {
  home.file.".config/eza/theme.yml".source = ezaTheme;
  home.sessionVariables.EZA_CONFIG_DIR = "${config.xdg.configHome}/eza";
}
