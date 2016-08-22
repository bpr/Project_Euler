module CombUtils

export swap!
function swap!{T<:Any, N<:Integer}(a::Array{T, 1}, i::N, j::N)
    tmp = a[i]
    a[i] = a[j]
    a[j] = tmp
end

export next_permutation!
# Precondition: Input is array consists of unique integers, initially sorted in
# strictly ascending order
function next_permutation!{N<:Integer}(ar::Array{N, 1})
    # 1. Find the highest index, i1 such that ar[i1] is the first of a pair of
    # elements in ascending order. If there isn't one, the sequence is the
    # highest permutation, so reverse the whole thing to begin again.
    alen = length(ar)
    i1 = alen - 1
    while i1 > 0
        if ar[i1] < ar[i1 + 1]
            break
        end
        i1 -= 1
    end
    if i1 > 0
        # 2. Find the highest index i2, such that i2 > i1 and ar[i2] > ar[i1].
        i2 = alen
        while i2 > i1
            if ar[i2] > ar[i1]
                break
            end
            i2 -= 1
        end
        # 3. Swap ar[i1] and ar[i2].
        swap!(ar, i1, i2)
        # 4. The elements from ar[i1 + 1] to the end are now in descending order
        # (a later permutation), so reverse them.
        reverse!(ar, i1 + 1, alen)
    else
        reverse!(ar, 1, alen)
    end
end

end
