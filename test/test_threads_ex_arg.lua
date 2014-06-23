local thread_code = function(...)
  local function assert_equal(name, a, b, ...)
    if a == b then return b, ... end
    print(name .. " Fail! Expected `" .. tostring(a) .. "` got `" .. tostring(b) .. "`")
    os.exit(1)
  end

  local a,b,c,d,e,f = ...
  assert_equal("1:", 1       , a )
  assert_equal("2:", nil     , b )
  assert_equal("3:", 'hello' , c )
  assert_equal("4:", nil     , d )
  assert_equal("5:", 2       , e )
  assert_equal("6:", nil     , f )
  assert_equal("#:", 6       , select("#", ...))
end

local llthreads = require"llthreads.ex"

local thread = llthreads.new(thread_code, 1, nil, 'hello', nil, 2, nil)

assert(thread:start())

assert(thread:join())

print("done!")