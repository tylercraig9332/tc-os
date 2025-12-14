{config, pkgs, ... }:
let
  myAliases = {
    switchs = "git add . && sudo nixos-rebuild switch --flake ~/.tc-os";
    switchh = "git add . && home-manager switch --flake ~/.tc-os";
    lsl = "ls -l";
    ".." = "cd ..";
    gits = "git status";
    gitpo = "git push origin";
    gitc = "git commit -m";
  };
in
{

  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };
}
