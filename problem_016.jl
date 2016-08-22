#!/usr/bin/env julia

function char_to_digit(c::Char)
    if isdigit(c)
        return Int(c) - Int('0')
    else
        throw(ArgumentError(@sprintf("%c is not a digit", c)))
    end
end

function main()
    s = string(BigInt(2) ^ BigInt(1000))
    digit_sum::Int64 = 0
    for i in 1:length(s)
        digit_sum += char_to_digit(s[i])
    end
    @printf("The sum of teh digits of 2 ^ 1000 is %d\n", digit_sum)
end

main()
