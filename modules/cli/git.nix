{ config, pkgs, ...}:

{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "master";
      user.name = "Tyler Craig";
      user.email = "tylercraig9332@gmail.com";
    };
  };
}
