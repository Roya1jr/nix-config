inputs: final: prev: {
  bqnlsp = inputs.bqn-lsp.packages.${prev.stdenv.hostPlatform.system}.lsp;
  monaspace-script-nerd =
    inputs.monaspace-script.packages.${prev.stdenv.hostPlatform.system}.monaspace-script-nerd;
}
