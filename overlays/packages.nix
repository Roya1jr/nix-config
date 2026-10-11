inputs: final: prev: {

  # BQN LSP
  bqnlsp = inputs.bqn-lsp.packages.${prev.stdenv.hostPlatform.system}.lsp;
  helixmaster = inputs.helix.packages.${prev.stdenv.hostPlatform.system}.default;
}
