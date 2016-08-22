#!/usr/bin/env julia

function collatz_len(n::Int64)
    count = 1
    while n > 1
        if n % 2 == 0
            n = div(n,2)
        else
            n = 3 * n + 1
        end
        count += 1
    end
    return count
end

function main()
    max_len = 0
    num = 0
    for i in 1:999999
        l = collatz_len(i)
        if l > max_len
            max_len = l
            num = i
        end
    end
    @printf("The number with the longest Collatz len is %d\n", num)
end

main()
