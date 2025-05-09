if vim.g.did_load_commands_plugin then
  return
end
vim.g.did_load_commands_plugin = true

local api = vim.api

api.nvim_create_user_command('DiagnosticDisable', function() vim.diagnostic.enable(false) end, {})
api.nvim_create_user_command('DiagnosticEnable', function() vim.diagnostic.enable(true) end, {})
