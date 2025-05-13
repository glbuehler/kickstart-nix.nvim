local ts_ls_command = 'typescript-language-server'

-- Check if typescript-language-server is available
if vim.fn.executable(ts_ls_command) ~= 1 then
  return
end

local root_files = {
  '.tsconfig',
  'package.json',
  'package-lock.json',
  'node_modules',
  '.git',
}

vim.lsp.start {
  name = 'ts_ls',
  cmd = { ts_ls_command, '--stdio' },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
}
