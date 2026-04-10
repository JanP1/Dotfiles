-- See `:help vim.lsp.start` for an overview of the supported `config` options.
local config = {
  name = "jdtls",
  cmd = {"/home/jan/.local/share/nvim/mason/bin/jdtls"},
  root_dir = vim.fs.root(0, {'gradlew', '.git', 'mvnw'}),

  settings = {
      java = {
        format = {
          tabsize = 4,
        }

      },
  },
}
require('jdtls').start_or_attach(config)
