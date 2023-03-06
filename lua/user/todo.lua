local ok, todo = pcall(require, "todo-comments")
if not ok then
  print("Todo-comments could not be initialized")
  return
end

todo.setup()

