local args = {...}
if #args < 1 then
  print("Usage: build <filename>")
  return
end
local filename = args[1]
if not fs.exists(filename) then
  print("File not found")
  return
end
local file = fs.open(filename, "r")
local code = file.readAll()
file.close()
print(code)
local codeParts = {}
local currentString = ""
for i=1, #code do
  local c = code:sub(i,i)
  if c == "\n" then
    table.insert(codeParts, currentString)
    currentString = ""
  else
    currentString = currentString .. c
  end
end