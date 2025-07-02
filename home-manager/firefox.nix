{ config, pkgs, lib, ... }:

let
  # Add-on set — more in: https://github.com/nix-community/nur-combined/blob/master/repos/rycee/pkgs/firefox-addons/addons.json
  c = config.florumbra.colors;
  extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    ublock-origin
    sponsorblock
    bitwarden
    vimium
  ];
in {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      ExtensionSettings = builtins.listToAttrs (
        builtins.map (ext:
          lib.nameValuePair ext.addonId {
            installation_mode = "force_installed";
            install_url = "file://${ext.src}";
            updates_disabled = true;
          }
        ) extensions
      );
    };

    profiles.default = {
      isDefault = true;
      extensions.packages = extensions;

      settings = {
        "browser.startup.homepage" = "about:blank";
        "browser.aboutwelcome.enabled" = false;
        "browser.tabs.closeWindowWithLastTab" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "ui.prefersReducedMotion" = 1;
        "browser.newtabpage.enabled" = false;
        "browser.uidensity" = 1;
        "browser.compactmode.show" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.donottrackheader.enabled" = true;
        "Identity.fxaccounts.enabled" = false;
        "services.sync.engine.passwords" = false;
        "signon.rememberSignons" = false;
        "signon.autofillForms" = false;
        "signon.formlessCapture.enabled" = false;
        "signon.management.page.breach-alerts.enabled" = false;
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.bookmarks.restore_default_bookmarks" = false;
        "browser.newtab.url" = "about:blank";
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.urlbar.suggest.quicksuggest" = false;
        "browser.urlbar.sponsoredTopSites" = false;
        "browser.urlbar.groupLabels.enabled" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.startup.page" = 3; # 3 = restore previous session
        "extensions.pocket.enabled" = false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "reader.parse-on-load.enabled" = false;
        "browser.tabs.firefox-view" = false;
        "app.update.auto" = false;
        "app.update.enabled" = false;
        "browser.messaging-system.whatsNewPanel.enabled" = false;
        "browser.preferences.moreFromMozilla" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
        "browser.urlbar.tipShownCount.searchTip_onboard" = 999;
        "browser.urlbar.tipShownCount.tabToSearch" = 999;
        "browser.urlbar.showSearchSuggestionsFirst" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "media.autoplay.default" = 5;  # 5 = block all autoplay
        "media.autoplay.blocking_policy" = 2;
        "browser.urlbar.suggest.history" = true;
        "browser.urlbar.suggest.topsites" = true;
        "browser.urlbar.suggest.bookmark" = false;
        "browser.urlbar.suggest.openpage" = false;
        "browser.urlbar.suggest.engines" = false;
        "browser.formfill.enable" = false;
        "dom.disable_open_during_load" = true;
        "permissions.default.desktop-notification" = 2; # 2 = Block by default
        "dom.webnotifications.enabled" = false;
        "dom.webnotifications.serviceworker.enabled" = false;
        "browser.download.useDownloadDir" = true;
        "browser.download.folderList" = 1;         # 1 = use system Downloads folder
        "browser.download.dir" = "${config.home.homeDirectory}/Downloads";
        "browser.download.panel.shown" = true;
        "pdfjs.disabled" = false;  # Keep built-in PDF viewer enabled
        "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        # Disable Firefox Suggest (which triggers ToS agreement screen)
        "browser.urlbar.quicksuggest.enabled" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.plugins" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.snippets" = false;
        # Explicitly disable Firefox Suggest onboarding flag
        "browser.urlbar.quicksuggest.showOnboardingDialog" = false;
        # Trick Firefox into thinking it’s already launched
        "browser.startup.homepage_override.mstone" = "ignore";
        "startup.homepage_welcome_url" = "";
        "startup.homepage_welcome_url.additional" = "";
        "browser.policies.status" = "ok";
        "browser.rights.3.shown" = true;
        "browser.shell.mostRecentDateSetAsDefault" = "1";
        "browser.usedOnWindows10" = true;


      };
    };
  };
  home.sessionVariables = {
    MOZ_FORCE_DISABLE_E10S = "1"; # optional
    MOZ_ALLOW_DOWNGRADE = "1";    # sometimes needed for older profiles
    MOZ_DISABLE_WELCOME = "1";    # disables about:welcome
  };

  
  home.file.".mozilla/firefox/default/chrome/userChrome.css".text = ''
    /* Disable History and Screenshot buttons */
    #history-panelmenu,
    #context-take-screenshot {
      display: none !important;
    }


    /* Apply Florumbra theme */
    :root {
      --toolbar-bgcolor: ${c.darkestGray} !important;
      --toolbar-color: ${c.softWhite} !important;
      --chrome-content-separator-color: ${c.darkerGray} !important;
      --tabs-background-color: ${c.darkGray} !important;
    }

    /* Tab text and background */
    .tab-background {
      background-color: ${c.darkGray} !important;
    }

    .tab-label {
      color: ${c.softWhite} !important;
    }

    /* Active tab */
    .tab-background[selected="true"] {
      background-color: ${c.coolGray} !important;
    }

    /* URL bar */
    #urlbar {
      background-color: ${c.darkerGray} !important;
      color: ${c.softWhite} !important;
    }

    /* Bookmark bar, if shown */
    #PersonalToolbar {
      background-color: ${c.darkestGray} !important;
    }
  '';
}

