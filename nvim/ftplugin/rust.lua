-- Exit if the language server isn't available
if vim.fn.executable('rust-analyzer') ~= 1 then
    print('rust_analyzer not available')
    return
end

local root_files = {
    '.git',
    'Cargo.toml'
}

vim.lsp.start {
    name = 'rust-analyzer',
    cmd = { 'rust-analyzer' },
    root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
    capabilities = require('user.lsp').make_client_capabilities(),
}
