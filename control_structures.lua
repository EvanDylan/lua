-- lua控制结构

-- if
-- 判断条件只有nil和false的时候才是假，特别注意0和空字符串为真
if a==3 then
    print(3)
elseif a==2 then
    print(2)
else
    print(false)
end

-- while
local i = 50
local num = 0;
while i >= 1  do
    i = i - 1;
    print('while')
end

-- repeat util 可以理解为java中的do while

repeat
    i = i + 1
    print('repeat')
until i == 50

-- for循环
-- 两种：数字、通用
-- numeric for, 对应的是开始、结束、步长
for i = 1, 10, 1 do
    print(i)
end

for i = 10, 1, -1 do
    print(i)
end
-- generic for
local array = {'a','b','c','d' }
for k, v in pairs(array) do
    print('k: ' .. k .. ', v: ' .. v)
end

--[[
k: 1, v: a
k: 2, v: b
k: 3, v: c
k: 4, v: d --]]
array = {['a']=a, ['b']=b }
for k, v in pairs(array) do
    print('k: ' .. k .. ', v: ' .. v)
end

-- break、return、 goto