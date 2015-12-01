require "fiddle/import"
require 'fiddle/types'

module WIN32API
  extend Fiddle::Importer
  dlload 'C:\\Windows\\System32\\user32.dll'
  include Fiddle::Win32Types

  extern 'HWND GetForegroundWindow()'
  extern 'int GetWindowText(HWND, char*, int)'
  extern 'int GetWindowTextLength(HWND)'
end

loop{
  hwnd = WIN32API.GetForegroundWindow
  buf_len = WIN32API.GetWindowTextLength(hwnd)
  str = ' ' * (buf_len + 1)
  result = WIN32API.GetWindowText(hwnd, str, str.length)

  p str.encode(Encoding.default_external)

  sleep 1
}
