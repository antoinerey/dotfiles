return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      tsserver = {
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = "/Users/antoine.rey/.volta/tools/image/packages/@vue/typescript-plugin/lib/node_modules/@vue/typescript-plugin",
              languages = { "javascript", "typescript", "vue" },
            },
          },
        },
        filetypes = {
          "javascript",
          "typescript",
          "vue",
        },
      },
    },
  },
}
