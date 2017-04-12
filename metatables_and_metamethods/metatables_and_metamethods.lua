--============================metatables
-- 元表为重定义Lua中任意一个对象(值)的默认行为提供了一种公开入口. 如同许多OO语言的操作符重载或方法重载

-- 需要注意的地方
--[[ 在Lua中任何一个值都有Metatable, 不同的值可以有不同的Metatable也可以共享同样的Metatable, 但在Lua本身提供的功能中,
不允许你改变除了table类型值外的任何其他类型值的Metatable,除非使用C扩展或其他库. setmetatable和getmetatable是唯一一组操
作table类型的Metatable的方法.--]]

-- 查询metamethod顺序,以a + b为例子
-- 先去找第一个a上metatables上定义的__add,不存在则取找b对应的__add,还不存在报错.
--=======================1.运算符重载
mt = {}
mt.__add = function(a, b)
    for _, v in ipairs(b) do
        a[#a + 1] = v
    end
    return a;
end

a, b = {5}, {4}
setmetatable(a, mt)

c = a + b
for k, v in ipairs(c) do
    print(v)
end

--=====================2.关系运算符重载
-- lua中只有三种关系运算符 __eq(等于), __lt(小于), __le(小于等于).对于~=转换为 not(a==b), a>b转换为b<a,a<=b转换为b<=a

--=====================3.函数库中的Metamethods
-- 举个栗子tostring,重载了tostring方法
t = {4,5}
print(tostring(t)) -- table: 0x7fc3ef402960

t = setmetatable(t, {
    __tostring = function(t)
        return table.concat(t, ',')
    end
})
print(tostring(t)) -- 重载之后 4,5

-- 保护Metamethods,访问metamethods:setmetatable和getmetatable是唯一一组操作
-- 通过设定Metamethods中的__metatable来保护Metamethods不被访问和更改
local s = {}
mt = {}
mt.__metatable = 'not your business'
setmetatable(s, mt)

print(getmetatable(s))
--setmetatable(s, {}) -- 抛出异常 cannot change a protected metatable

--=====================4.表相关Metamethods
-- __index  访问不存在的key时,会访问__index,__index可以是一个function也可以是一个table
-- __newindex 给不存在的key设定值时,会使用__nexindex
-- rawset rawget 绕过上面两者直接对table操作

-- 举个栗子：
t = setmetatable({1,2,3,4,5}, {
    __index = function(table, key)
        return 0 -- 不存在的给默认0
    end,
    -- 对不存在的key设定值时,会使用__nexindex
    __newindex = function(table, key, value)
     --   table[key] = 1000 -- 这里本来是想强制覆盖t[10] = 100的赋值,但是出现了堆栈溢出的异常.
    end                   --仔细一想也是情理之中,table[key]本身就是不存在的key,再赋值的时候又会访问__newindex,引发死循环的惨案
})
print(t[10]) -- 输出默认值0
t[10] = 100
print(t[10]) -- 同样输出0,虽然上面显示的赋值100,但是由于显示的重写了__newindex方法,但是方法里什么都没做

rawset(t, 10, 100)
print(t[10]) -- 输出100, 通过rawset直接绕过__newindex
print(rawget(t, 7)) -- 输出nil, 通过rawget直接绕过__index