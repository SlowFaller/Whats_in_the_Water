local Util = {}

function Util.MultiplyN(n, m, ...)
    printTable(arg)
    if arg.n > 0 then
        local result = n*m

        for index, value in ipairs(arg) do
            result = result*value
        end

        return result
    else
        return n*m
    end
end

function Util.Multiply(n, m)
    return n * m
end

function Util.Square(n, m)
    if m == 0 then
        return 1
    elseif m == 1 then
        return n
    else
        local result = n

        for i = 2, m, 1 do
            result = result * n
        end

        return result
    end
end

return h