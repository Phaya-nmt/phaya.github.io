require 'Win32api'

hwnd = Win32API.new('C:\\Windows\\System32\\user32.dll', 'GetForegroundWindow', [], 'N')
GetWindowText       = Win32API.new('C:\\Windows\\System32\\user32.dll', 'GetWindowText', 'LPI', 'I')
GetWindowTextLength = Win32API.new('C:\\Windows\\System32\\user32.dll', 'GetWindowTextLength', 'L', 'I')

loop{
  buf_len = GetWindowTextLength.call(hwnd.call)
  str = ' ' * (buf_len + 1)

  result = GetWindowText.call(hwnd.call, str, str.length)
  puts str.encode(Encoding.default_external)

  sleep 1
}
