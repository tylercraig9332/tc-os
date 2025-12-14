{config, pkgs, ...}:

{
  programs.zed-editor = {
    enable = true;
    extensions = ["nix" "cappuccin"];
    userSettings = {
      telemetry.metrics = false;
      vim_mode = false;
      theme = "Cappuccin";
      terminal = {
        env = {
          EDITOR = "zed --wait";
          TERM = "ghostty";
        };
        shell = "system";
      };
    };
  };
}
