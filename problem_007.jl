using IntUtils

function main()
    if length(ARGS) > 0
        n = parse(Int64, ARGS[1])
        primes = sieve_of_eratosthenes(1_000_000)
        num_primes = 0
        nth = -1
        for i in 1:length(primes)
            if primes[i]
                num_primes += 1
                if num_primes == n
                    nth = i
                    break
                end
            end
        end

        @printf("The %dth prime is %d\n", n, nth)
    else
        error("this program needs a single numeric argument")
    end
end

main()
