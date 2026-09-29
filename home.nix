{ config, pkgs, ... }:

{
    home.username = "iketk";
    home.homeDirectory = "/home/iketk";
    home.stateVersion = "26.05";
    programs.bash.enable = true;

    programs.git = {
        enable = true;
        settings.user = {
            name  = "takaaat";
            email = "129288760+takaaat@users.noreply.github.com";
        };
    };
}
