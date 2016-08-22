#!/usr/bin/env julia

numeral_lengths =
    Dict(0 => 0,
         1 => 3,
         2 => 3,
         3 => 5,
         4 => 4,
         5 => 4,
         6 => 3,
         7 => 5,
         8 => 5,
         9 => 4,
         10 => 3,
         11 => 6,
         12 => 6,
         13 => 8,
         14 => 8,
         15 => 7,
         16 => 7,
         17 => 9,
         18 => 8,
         19 => 8,
         20 => 6,
         30 => 6,
         40 => 5,
         50 => 5,
         60 => 5,
         70 => 7,
         80 => 6,
         90 => 6,
         100 => 7,
         1000 => 8)

function number_length(n::Int64)
    assert(n < 10_000)
    result = 0
    (dig, n) = divrem(n, 1000)
    result += numeral_lengths[dig]
    if dig > 0
        result += numeral_lengths[1000]
    end
    (dig, n) = divrem(n, 100)
    result += numeral_lengths[dig]
    if dig > 0
        result += numeral_lengths[100]
        result += n > 0 ? 3 : 0
    end
    if n > 19
        (dig, n) = divrem(n, 10)
        result += numeral_lengths[dig*10]
        result += numeral_lengths[n]
    else
        result += numeral_lengths[n]
    end

    return result
end

function main()
    max_len = 0
    num = 0
    for i in 1:1000
        num += number_length(i)
    end
    @printf("The number of letters is %d\n", num)
end

main()
