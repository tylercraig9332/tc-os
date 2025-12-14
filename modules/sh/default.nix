{config, pkgs, ... }:
let
  myAliases = {
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
