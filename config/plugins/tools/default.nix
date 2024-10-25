{
  imports = [
    ./ai.nix
    ./autopairs.nix
    ./comment.nix
    ./conform.nix
    ./escape.nix
    ./fzf-lua.nix
    ./neoscroll.nix
    ./git.nix
    ./outline.nix
    ./oil.nix
    ./surround.nix
    ./telescope.nix
    ./which-key.nix
    ./hover.nix
    ./terminal.nix
    ./glow.nix
    ./request.nix
    ./dap.nix
  ];

  plugins = {
    hex.enable = true;
  };
}
