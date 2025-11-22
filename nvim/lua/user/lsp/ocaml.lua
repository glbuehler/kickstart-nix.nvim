-- Exit if the language server isn't available
if vim.fn.executable('ocamllsp') ~= 1 then
    print('ocamllsp not available')
    return
end

local root_files = {
    '.git',
    'dune-project',
    'dune-workspace'
}

vim.api.nvim_create_autocmd('Filetype', {
  pattern = {
    'ocaml',
    'ocaml.interface',
    'ocaml.menhir',
    'ocaml.ocamllex',
    'dune',
    'reason'
  },
  callback = function()
    vim.lsp.start {
        name = 'ocamllsp',
        cmd = { 'ocamllsp' },
        root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
        capabilities = require('user.lsp').make_client_capabilities(),
    }
  end,
})
