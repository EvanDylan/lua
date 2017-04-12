--=====================数据结构

--============ 一维数组
-- 不必指定长度，大小自动动态增长，下坐标从1开始，访问到不存的元素返回nil
local array = {1}

print(array[1])
--============ 矩阵和多维数组
local mt = {}
for i = 1, 10 do
    mt[i] = {}
    for j = 1, 10 do
        mt[i][j] = 1
    end
end
print(mt[1][1])


--=========== 链表
local linkedList = {}

for i = 1, 10 do
    linkedList = {next = linkedList, value = i}
end

while linkedList do
    print(linkedList.value)
    linkedList = linkedList.next
end

--============ 队列、双端队列
List = {first = 0, last = -1}

function List:pushLeft(value)
    local first = self.first - 1
    self.first = first
    self[first] = value
end

function List:pushRight (value)
    local last = self.last + 1
    self.last = last
    self[last] = value
end

function List:popLeft()
    local first = self.first
    if first > self.last then error("list is empty") end
    local value = self[first]
    self[first] = nil -- to allow garbage collection
    self.first = first + 1
    return value
end

function List:popRight()
    local last = self.last
    if last < self.first then error('list is empty ') end
    local value = self[last]
    self[last] = nil
    self.last = last - 1
    return value
end

list = List
list:pushLeft(1)
print(list:popLeft())

--================= Sets、Bags(also called multisets)
--In Lua, an efficient and simple way to represent such sets is
--to put the set elements as indices in a table
local reserved = {
    ['while'] = true, -- 等价于while = true,但是因为while是关键字
    it = true,
    'it', -- reserved[1] = it
    it    -- 不会被保存在reserved中,因为it是nil
}
print(reserved['while'])
function Set(list)
    local set = {}
    for _, v in ipairs(list) do
        set[v] = true
    end
    return set
end
reserved = Set({'while', 'if', 'else', 'elseif'})
--  Bags, also called multisets, differ from regular sets in that
-- each element can appear multiple times.
--An easy representation for bags in Lua is similar to the previous representation for sets, but with a counter associated to each key.
--To insert an element we increment its counter:
function insert (bag, element)
bag[element] = (bag[element] or 0) + 1
end
--To remove an element we decrement its counter:
function remove (bag, element)
local count = bag[element]
bag[element] = (count and count > 1) and count - 1 or nil
end
--We only keep the counter if it already exists and it is still greater than zero.

--===============String Buffers
local string = ''
for line in io.lines() do
    string = string .. line -- 每次都会产生新的字符串
end
print(string)

-- 使用table作为缓冲区,读取完之后,一次性合并
local buffer = {}
for line in io.lines do
    table.insert(buffer, line)
end
table.concat(buffer)