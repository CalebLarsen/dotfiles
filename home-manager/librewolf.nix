{ config, pkgs, lib, ... }:

let
  c = config.florumbra.colors;
  extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    ublock-origin
    sponsorblock
    bitwarden
    vimium
  ];
in {
  programs.librewolf.policies = {
    ExtensionSettings = builtins.listToAttrs (
      builtins.map (ext:
        lib.nameValuePair ext.addonId {
          installation_mode = "force_installed";
          install_url = "file://${ext.src}";
          updates_disabled = true;
        }
      ) extensions
    );
    Homepage = {
      StartPage = "none";  # disables default new tabs
      URL = "about:blank";
      Locked = true;
    };

    # Ensure session restore doesn't interfere
    RestoreSession = false;
  };
  
  programs.librewolf = {
    enable = true;

    settings = {
      "browser.tabs.closeWindowWithLastTab" = true;
      "ui.prefersReducedMotion" = 1;
      "browser.newtabpage.enabled" = false;
      "browser.uidensity" = 1;
      "browser.compactmode.show" = true;
      "privacy.trackingprotection.enabled" = true;
      "privacy.donottrackheader.enabled" = true;

      "signon.rememberSignons" = false;
      "signon.autofillForms" = false;
      "signon.formlessCapture.enabled" = false;
      "signon.management.page.breach-alerts.enabled" = false;

      "browser.toolbars.bookmarks.visibility" = "never";
      "browser.bookmarks.restore_default_bookmarks" = false;
      "browser.urlbar.suggest.quicksuggest.sponsored" = false;
      "browser.urlbar.suggest.quicksuggest" = false;
      "browser.urlbar.sponsoredTopSites" = false;
      "browser.urlbar.groupLabels.enabled" = false;
      "browser.urlbar.suggest.searches" = false;
      "browser.startup.page" = 0;
      "reader.parse-on-load.enabled" = false;
      "media.autoplay.default" = 5;
      "media.autoplay.blocking_policy" = 2;
      "browser.urlbar.suggest.history" = true;
      "browser.urlbar.suggest.topsites" = true;
      "browser.urlbar.suggest.bookmark" = false;
      "browser.urlbar.suggest.openpage" = false;
      "browser.urlbar.suggest.engines" = false;
      "browser.formfill.enable" = false;
      "dom.disable_open_during_load" = true;
      "permissions.default.desktop-notification" = 2;
      "dom.webnotifications.enabled" = false;
      "dom.webnotifications.serviceworker.enabled" = false;
      "browser.download.useDownloadDir" = true;
      "browser.download.folderList" = 1;
      "browser.download.dir" = "${config.home.homeDirectory}/Downloads";
      "browser.download.panel.shown" = true;
      "pdfjs.disabled" = false;
      "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;
      "browser.urlbar.update2.oneOffsRefresh" = false;
    };

  };

  home.file.".librewolf/chrome/userChrome.css".text = ''
    #history-panelmenu,
    #context-take-screenshot {
      display: none !important;
    }

    :root {
      --toolbar-bgcolor: ${c.darkestGray} !important;
      --toolbar-color: ${c.softWhite} !important;
      --chrome-content-separator-color: ${c.darkerGray} !important;
      --tabs-background-color: ${c.darkGray} !important;
    }

    .tab-background {
      background-color: ${c.darkGray} !important;
    }

    .tab-label {
      color: ${c.softWhite} !important;
    }

    .tab-background[selected="true"] {
      background-color: ${c.coolGray} !important;
    }

    #urlbar {
      background-color: ${c.darkerGray} !important;
      color: ${c.softWhite} !important;
    }

    #PersonalToolbar {
      background-color: ${c.darkestGray} !important;
    }
  '';
}
