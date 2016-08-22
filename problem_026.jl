using CombUtils


function scale_numerator(numerator, denominator)
    while numerator < denominator
        numerator *= 10
    end
    return numerator
end

function reciprocal_cycle_len{T<:Integer}(n::T)
    num = scale_numerator(10, n)
    while num < n
        num *= 10
    end
    
    while num > n
        if num < n
            num *= 10
        else
            num %= n
        end
    end
end

function main()
    seq_length = 0
    num = 0

    for i in 1000:-1:1
        if seq_length >= i
            break
        end

        found_remainders = zeros(i)
        value = 1
        position = 0

        while value != 0 && found_remainders[value] == 0
            found_remainders[value] = position;
            value *= 10
            value %= i
            position += 1
        end

        rem_at_value = value == 0 ? 0 : found_remainders[value]
        
        if position - rem_at_value > seq_length
            num = i
            seq_length = position - rem_at_value
        end
    end
    @printf("num = %d, seq_length = %d\n", num, seq_length)
end

main()
