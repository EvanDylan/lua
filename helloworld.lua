--
-- Created by IntelliJ IDEA.
-- User: evan
-- Date: 2017/3/31
-- Time: 下午10:28
-- To change this template use File | Settings | File Templates.
--

-- hello world
print('hello lua')

--
int = 5

float = 5.5

boolean = false

string = '字符串'

null = nil

func = function()
    print("i'm function")
end


-- co-body 1 10
-- foo 2
-- main true 4
-- co-body 4
-- main true 4
--

co = coroutine.create(function (a,b)
    print("co-body", a, b)
    local r = foo(a+1)
    print("co-body", r)
    local r, s = coroutine.yield(a+b, a-b)
    print("co-body", r, s)
    return b, "end"
end)

function foo (a)
    print("foo", a)
    return coroutine.yield(2*a)
end

print("main", coroutine.resume(co, 1, 10))
print("main", coroutine.resume(co, "r"))
print("main", coroutine.resume(co, "x", "y"))
print("main", coroutine.resume(co, "x", "y"))

