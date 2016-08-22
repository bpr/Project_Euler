module IntUtils


export is_prime
function is_prime{T<:Integer}(n::T)::Bool
    if n > 0
        for d in 2:(isqrt(n) + 1)
            if n % d == 0
                return false
            end
        end
        return true
    end
    return false
end

export prime_factors
function prime_factors(n::Int64)
    factors = Int64[]
    d = 2
    while n > 1
        while n % d == 0
            push!(factors, d)
            n = div(n,d)
        end
        d += 1
        if d * d > n
            if n > 1
                push!(factors, n)
            end
            break
        end
    end
    return factors
end

export num_factors
function num_factors(n::Int64)
    d = 2
    num_factors::Int64 = 1
    while n > 1
        num_d = 0
        while n % d == 0
            num_d += 1
            n = div(n,d)
        end
        num_factors *= (num_d + 1)
        d += 1
        if d * d > n
            if n > 1
                num_factors *= 2
            end
            break
        end
    end
    return num_factors
end

export prime_factors_table
function prime_factors_table(n::Int64)
    factors = Dict{Int64, Int64}()
    d = 2
    while n > 1
        while n % d == 0
            num_d = get(factors, d, 0)
            factors[d] = num_d + 1
            n = div(n,d)
        end
        d += 1
        if d * d > n
            if n > 1
                num_d = get(factors, n, 0)
                factors[n] = num_d + 1
            end
            break
        end
    end
    return factors
end

export sieve_of_eratosthenes
function sieve_of_eratosthenes(n)
    primes = trues(n)
    primes[1] = false
    p = 2
    while p*p <= n
        if primes[p]
            for i in p*p:p:n
                primes[i] = false
            end
        end
        p += 1
    end
    return primes
end

export divisors
function divisors(n::Integer)
    result = Set{Integer}()
    sq = convert(Integer, floor(sqrt(n))) + 1
    for i in 1:(sq+1)
        (d,r) = divrem(n, i)
        if r == 0
            push!(result, i)
            if i != d
                push!(result, d)
            end
        end
    end
    return result
end

export proper_divisors
function proper_divisors(n::Integer)
    result = Set{Integer}()
    sq = convert(Integer, floor(sqrt(n))) + 1
    for i in 1:(sq+1)
        (d,r) = divrem(n, i)
        if r == 0
            push!(result, i)
            if i != d && d != n
                push!(result, d)
            end
        end
    end
    return result
end

export is_amicable
function is_amicable(n::Integer)
    s1 = sum(divisors(n)) - n
    s2 = sum(divisors(s1)) - s1
    return s2 == n && s1 != s2
end

end
