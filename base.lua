-- 单行注释

--[[
-- 多行注释
--]]


-- 基础数据类型(8种)
-- 动态类型语言,只有值才有类型,所有的值携带自己的类型

-- nil
null = nil
print(type(null))

-- boolean
boolean = true
boolean = false
print(type(boolean))

-- number
number = 1
number = 1.8
print(type(number))



-- string
string = 'lua'
string = 'dddd" "'
string = "ddd' '" .. 'ddd' -- .. 连接操作
string = [[dddddddd
dddddddddddd[][][][][]
]]
string = [=[dddd
dafdsa[][][][][]
]=]
print(type(string))


-- function
add = function(a,b)
    return a + b
end
print(type(add))


-- table
-- providing a.name as syntactic sugar for a["name"]
-- 表是 Lua 中唯一的数据结构， 它可被用于表示普通数组、序列、符号表、集合、记录、图、树等等
table = {}
x = "y"
table[x] = 10
print(table[x])
print(table.x) --> nil, table["x"]
print(table.y)


i = 10; j = "10"; k = "+10"
a = {}
a[i] = "one value"
a[j] = "another value"
a[k] = "yet another value"
print(a[i])
print(a[j])
print(a[k])
print(a[tonumber(j)])  --> one value
print(a[tonumber(k)])  --> one value

-- #,取长度操作符
-- 限定key只能是{1...n}的集合里正整数
-- 且table的key必须是连续的,这里的连续不是只数值是递增,而是所有的key必须有值,中间不能有nil
for i = 1, #a do
    print(a[i])
end

-- paris
-- will iterate over all key–value pairs of table
for k, v in pairs(a) do
    print(k .. v)
end

-- iparis
-- 从1开始遍历,遇到nil就退出
for k, v in ipairs(a) do
    print('key' .. k .. 'value' .. v)
end

--           -- 完全用户对象,一块由Lua管理的内存对象
-- userdata -
--           --