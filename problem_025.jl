using CombUtils


function main()
    f1 = big(1)
    f2 = big(1)
    index = 2
    num_digits = 1
    while num_digits < 1000
        index += 1
        tmp = f2
        f2 += f1
        f1 = tmp
        num_digits = ndigits(f2)
    end
    @printf("The first index where the nth fib has 1000 digits is %d\n", index)
end

main()
