local present, diffview = pcall(require, "diffview")
if not present then
  return
end

diffview.setup({
  diff_binaries = false,
})
