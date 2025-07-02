{ lib, ... }:

let
  colors = {
    white        = "#ffffff";
    softWhite    = "#e0e2e4";
    lightGray    = "#7e8e91";
    coolGray     = "#6b8ca5";
    gray         = "#444444";
    darkGray     = "#333333";
    darkerGray   = "#222222";
    darkestGray  = "#1b1d1e";

    pink         = "#f92672";
    green        = "#a6e22e";
    lightBlue    = "#66d9ef";
    teal         = "#3fe3b5";

    lightOrange  = "#e8b97a";
    orange       = "#fd971f";
    yellow       = "#e6db74";
    purple       = "#ae81ff";
    lightGreen   = "#b6e87e";
  };
in {
  options.florumbra.colors = lib.mkOption {
    type = lib.types.attrs;
    default = colors;
    description = "Florumbra theme colors.";
  };
}
