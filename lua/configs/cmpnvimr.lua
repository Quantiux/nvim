local cmp_nvim_r_status_ok, cmp_nvim_r = pcall(require, "cmp_nvim_r")
if not cmp_nvim_r_status_ok then
  vim.notify("nvim-r completion plugin not loaded!")
  return
end

cmp_nvim_r.setup {
  filetypes = {'r', 'rmd', 'rhelp'},
  doc_width = 60
}
