{ config, pkgs, ... }:

{
    home.username = "iketk";
    home.homeDirectory = "/home/iketk";
    home.stateVersion = "26.05";

    programs.git = {
        enable = true;
        settings.user = {
            name  = "takaaat";
            email = "129288760+takaaat@users.noreply.github.com";
        };
    };

    programs.ghostty = {
    	enable = true;
	enableZshIntegration = true;
	settings = {
		font-size = 14;
		window-decoration = "none";
		window-padding-x = 3;
		window-padding-y = 3;
		window-padding-balance = true;
	};
    };

    programs.starship = {
    	enable = true;
    };

    programs.rofi = {
    	enable = true;
    };

    programs.zsh = {
    	enable = true;
	enableCompletion = true;
	autosuggestion.enable = true;
	syntaxHighlighting.enable = true;
	shellAliases = {
		ll = "ls -l";
	};
	history.size = 10000;
	history.ignoreAllDups = true;
	history.path = "$HOME/.zsh_history";
	history.ignorePatterns = ["rm *" "cp *"];
    };
}
