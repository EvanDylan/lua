--[[
-- 1. 函数参数如果只有一个，并且参数时字面量字符串或者表结构，
-- 那么函数的括号是可选的.下面的例子是等价的：
-- --]]

print'hello lua'
print('hello lua')
type{}
type({})

--[[
-- 2.You can call a function with a number of arguments different from its
-- number of parameters. Lua adjusts the number of arguments to the number
-- of parameters, as it does in a multiple assignment: extra arguments are thrown away;
-- extra parameters get nil.
-- 函数调用时会自动调整参数的数量，多传的参数会被自动忽略，少传的参数会被赋予nil
--]]
function f(a, b)
    print(a, b)
end

print(f(3)) -- 3 nil
print(f(3, 4)) -- 3 4
print(f(3, 4, 5)) -- 3 4 (5 is discarded)

--======================
-- [[
-- 多个返回值函数调用
-- 1.多个赋值的情况，并且函数是在表达式的最后，才会匹配返回所需要的结果
-- 2.多个赋值的情况，如果函数不是在表达式的最后，仅会返回一个结果
-- 3.可以直接用集合来所有的结果，但是也要服从以上1、2两条原则
-- 4.可以使用一对括号来让多个返回值的函数只返回第一个结果
--   You can force a call to return exactly one result by enclosing it in an extra pair of parentheses
-- -- ]]
function foo(a, b)
    return a, b
end

-- 1
local x = foo(3, 4) --> x = 3
local x, y = foo(3, 4) --> x =3 , y =4
local x, y, z = foo(3, 4) --> x = 3, y = 4, z = nil
local x, y, z = 10, foo(3, 4) --> x = 10, y = 3, z = 4
local x ,y, z = foo(3, 4), 10 --> x = 3, y = 10, z = nil
-- 2
local a, b, c, d = foo(1, 2), foo(3, 4) --> a = 1, b = 3, c = 4, d = nil
-- 3
local a = {foo(1, 2)}
print(#a) --> 2
local a = {foo(3,4), foo(1, 2)}
print(#a) --> 3
-- 4
local a = {(foo(3,4)), (foo(1, 2))} -- 括号限定多个结果函数只返回第一个结果,如果函数没有返回值，则不返回
print(#a) --> 2


--======================
--[[
-- 可变参数函数,用三个点来表示(...)
-- --]]
function add(...)
    local sum = 0;
    for k, v in pairs{...} do
        sum = sum + v;
    end
    return sum;
end

print(add(1,2,nil,3)) --> 6

--=======================
--[[
-- 给参数命名
-- 通过集合的方式，自定义属性
--]]
function rename(arg)
    print(arg.old .. arg.new)
end
rename({old = 'old', new = 'new'})
rename{old = 'old', new = 'new'}
