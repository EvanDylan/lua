--========================
-- Lua中函数声明方式function add() ... end 只是 add = function() ... end的语法糖,所以函数也是变量
-- Lua中支持函数式编程的特征：
--  1.闭包、
--  2.高阶函数(把函数作为参数或者返回值传递)、
--  3.尾递归(Lua对尾递归限定比较严格return func(args)),因为尾递归返回时不需要再原路返回,
--    所以不需要存储上个函数的堆栈信息,也就不存在堆栈溢出的危险
--  4.局部函数创建的几种方式：
--    1)table
--      lib = {}
--      lib.foo = function() {} end
--    2)lib = {
--          foo = function() {} end
--      }
--    3)local f = function() end 在这个函数里面不能调用自己,因为f并没有初始化完成
--    4)local function f() end 上面写法的语法糖 展开 local f; f = function() {} end