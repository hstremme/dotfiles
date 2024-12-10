return {
  'williamboman/mason.nvim',
  dependencies = {'williamboman/mason-lspconfig.nvim'},
  config = function()
    require('mason').setup({})
    require('mason-lspconfig').setup({
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
                language = "de-DE"
              }
            },
            on_attach = function(client, bufnr)
              print('ltex config loaded')
            end
          })
        end
      },
    })
  end
}
