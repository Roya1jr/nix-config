inputs: final: prev: {
  bqnlsp = inputs.bqn-lsp.packages.${prev.stdenv.hostPlatform.system}.lsp;
  helixmaster = inputs.helix.packages.${prev.stdenv.hostPlatform.system}.default;
  monaspace-script-nerd =
    inputs.monaspace-script.packages.${prev.stdenv.hostPlatform.system}.monaspace-script-nerd;
}
