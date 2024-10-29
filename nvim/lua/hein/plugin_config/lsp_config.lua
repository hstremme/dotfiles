local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- here you can setup the language servers
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {"rust_analyzer"},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,

    -- this is a custom handler for ltx (which is working, but the change is not displayed in the Mason ui)
    ltex = function ()
      require('lspconfig').ltex.setup({
        bob = true,
        settings = {
          ltex = {
            language = "de-DE",
            dictionary = {
              ["de-DE"] = {"Co-Creation"}
            }
          }
        },
        on_attach = function(client, bufnr)
          print('ltex config loaded')
        end
      })
    end
  }
})
