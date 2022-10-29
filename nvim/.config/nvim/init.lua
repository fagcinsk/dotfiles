local status_ok, impatient = pcall(require, "impatient")

if status_ok then
    impatient.enable_profile()
end

require 'global'
require 'disable-builtins'
require 'options'
require 'autocommands'
require 'plugins'
require 'mappings'

-- vim.cmd 'colorscheme OceanicNext'
-- vim.cmd 'colorscheme kanagawa'
vim.cmd 'colorscheme onedark'

-- TODO: add support for js in phtml
