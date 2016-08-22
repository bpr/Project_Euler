using IntUtils

function main()
    primes = sieve_of_eratosthenes(2_000_000)
    sum_primes = 0
    for i in 1:length(primes)
        if primes[i]
            sum_primes += i
        end
    end

    @printf("The sum of primes under 2000000 is %d\n", sum_primes)
end

main()
