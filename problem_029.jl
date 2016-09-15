function main()
    set_of_terms = Set{BigInt}()
    for a in 2:100
        for b in 2:100
            push!(set_of_terms, big(a) ^ big(b))
        end
    end
    @printf("%d distinct terms\n", length(set_of_terms))
end

main()
