--
-- Created by IntelliJ IDEA.
-- User: evan
-- Date: 2017/4/7
-- Time: 上午10:42
-- To change this template use File | Settings | File Templates.
--

--===============================
-- Coroutines(协程),三种状态：挂起、运行、死亡
--
--
--
--
--===============================
-- 以生产者为驱动的生产者消费者模式
local consumer = coroutine.create(function(i)
    while true do
        print('producer返回:' .. i)
        local i = i - 1
        print('consumer减一:' .. i)
        coroutine.yield(i)
    end
end)

local producer = coroutine.create(function()
    while true do
        local i = i or 0
        i = i + 1
        print('producer加一:' .. i)
        status, value = coroutine.resume(consumer, i)
        print('consumer返回：' .. value)
        i = value
    end
end)

coroutine.resume(producer)
