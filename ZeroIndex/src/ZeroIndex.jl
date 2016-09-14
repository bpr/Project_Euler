module ZeroIndex
# I really (REALLY) want zero indexd arrays for some DP problems, here's
# a quick hack to get them

export vget
function vget{T<:Any, N<:Integer}(a::Array{T, 1}, i::N)::T
    return a[i + 1] 
end

export vset!
function vset!{T<:Any, N<:Integer}(a::Array{T, 1}, i::N, val::T)
    a[i + 1] = val
end

export aget
function aget{T<:Any, N<:Integer}(a::Array{T, 2}, i::N, j::N)::T
    return a[i + 1, j + 1] 
end

export aset!
function aset!{T<:Any, N<:Integer}(a::Array{T, 2}, i::N,  j::N, val::T)
    a[i + 1, j + 1] = val
end

end # module ZeroIndex
