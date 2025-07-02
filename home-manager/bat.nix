{ config, pkgs, ... }:

let
  c = config.florumbra.colors;

  florumbraBat = pkgs.writeText "florumbra.tmTheme" ''
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
      "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>name</key><string>florumbra</string>
      <key>settings</key>
      <array>
        <!-- base -->
        <dict><key>settings</key><dict>
          <key>foreground</key><string>${c.softWhite}</string>
          <key>background</key><string>${c.darkestGray}</string>
        </dict></dict>

        <!-- syntax -->
        <dict><key>scope</key><string>comment</string><key>settings</key><dict><key>foreground</key><string>${c.lightGray}</string></dict></dict>
        <dict><key>scope</key><string>keyword</string><key>settings</key><dict><key>foreground</key><string>${c.pink}</string></dict></dict>
        <dict><key>scope</key><string>constant.numeric</string><key>settings</key><dict><key>foreground</key><string>${c.purple}</string></dict></dict>
        <dict><key>scope</key><string>constant.character.escape</string><key>settings</key><dict><key>foreground</key><string>${c.pink}</string></dict></dict>
        <dict><key>scope</key><string>string</string><key>settings</key><dict><key>foreground</key><string>${c.yellow}</string></dict></dict>
        <dict><key>scope</key><string>variable</string><key>settings</key><dict><key>foreground</key><string>${c.softWhite}</string></dict></dict>
        <dict><key>scope</key><string>function</string><key>settings</key><dict><key>foreground</key><string>${c.green}</string></dict></dict>
        <dict><key>scope</key><string>storage</string><key>settings</key><dict><key>foreground</key><string>${c.orange}</string></dict></dict>
        <dict><key>scope</key><string>type</string><key>settings</key><dict><key>foreground</key><string>${c.lightBlue}</string></dict></dict>
        <dict><key>scope</key><string>constant.language</string><key>settings</key><dict><key>foreground</key><string>${c.purple}</string></dict></dict>
        <dict><key>scope</key><string>entity.name.class</string><key>settings</key><dict><key>foreground</key><string>${c.teal}</string></dict></dict>
        <dict><key>scope</key><string>entity.name.function</string><key>settings</key><dict><key>foreground</key><string>${c.green}</string></dict></dict>
        <dict><key>scope</key><string>markup.raw.inline</string><key>settings</key><dict><key>foreground</key><string>${c.lightBlue}</string></dict></dict>
        <dict><key>scope</key><string>markup.heading</string><key>settings</key><dict><key>foreground</key><string>${c.teal}</string><key>fontStyle</key><string>bold</string></dict></dict>
        <dict><key>scope</key><string>markup.bold</string><key>settings</key><dict><key>foreground</key><string>${c.yellow}</string><key>fontStyle</key><string>bold</string></dict></dict>
        <dict><key>scope</key><string>markup.italic</string><key>settings</key><dict><key>foreground</key><string>${c.pink}</string><key>fontStyle</key><string>italic</string></dict></dict>
        <dict><key>scope</key><string>constant.other</string><key>settings</key><dict><key>foreground</key><string>${c.orange}</string><key>fontStyle</key><string>bold</string></dict></dict>
        <dict><key>scope</key><string>support.function</string><key>settings</key><dict><key>foreground</key><string>${c.orange}</string></dict></dict>
      </array>
    </dict>
    </plist>
  '';
in {
  home.file.".config/bat/themes/florumbra.tmTheme".source = florumbraBat;
  home.sessionVariables.BAT_THEME = "florumbra";
}
