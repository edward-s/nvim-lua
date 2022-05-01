local present, todoComments = pcall(require, "todo-comments")

if not present then
  return
end

todoComments.setup({})
