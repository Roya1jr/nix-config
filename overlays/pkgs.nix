inputs: final: prev: {

  # BQN LSP
  bqnlsp = inputs.bqn-lsp.packages.${prev.system}.lsp;

  # Latest Mesa from unstable
  mesa = inputs.nixpkgs-unstable.legacyPackages.${prev.system}.mesa;

}
