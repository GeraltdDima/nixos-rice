{ pkgs, ... }:

{
    programs.pyenv = {
        enable = true;
        enableFishIntegration = true;
        rootDirectory = "$HOME/.pyenv";
        package = pkgs.pyenv;
    }
}
