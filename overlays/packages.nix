inputs: final: prev: {

  # BQN LSP
  bqnlsp = inputs.bqn-lsp.packages.${prev.system}.lsp;
  helixmaster = inputs.helix.packages.${prev.system}.default;
}
