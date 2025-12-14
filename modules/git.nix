{ config, pkgs, ...}:

{
  programs.git = {
    enable = true;

    userName = "Tyler Craig";
    userEmail = "tylercraig9332@gmail.com"

    extraConfig = {
      init = {
        defaultBranch = "master";
      };
      color = {
        ui = true;
      };
    };
  };
}
