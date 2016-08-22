#!/usr/bin/env julia

function main()
    accum = 0
    fib_n  = 1
    fib_nn = 2
    fib_max = 4_000_000
    while fib_n <= fib_max
        if fib_n % 2 == 0
            accum += fib_n
        end
        tmp = fib_n + fib_nn
        fib_n = fib_nn
        fib_nn = tmp
    end
    @printf("The sum of even Fibonacci numbers up to %d is %d\n",
            fib_max, accum)
end

main()
