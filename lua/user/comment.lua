local ok, comment = pcall(require, "Comment")
if not ok then
  print("Comment could not be initialized")
  return
end

comment.setup()

