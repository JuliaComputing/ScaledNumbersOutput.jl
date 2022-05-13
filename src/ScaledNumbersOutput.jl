module ScaledNumbersOutput
export to_SI

using OrderedCollections
const si_scaling_orders = OrderedDict{Symbol,Int}(
#    :Y => 24,
#    :Z => 21,
#    :E => 18,   # this is very confusing with 3E6
    :P => 15,
    :T => 12,
    :G => 9,
    :M => 6,
    :k => 3,
    Symbol("") => 0,
    :m => -3,
    :u => -6,
    :n => -9,
    :p => -12,
    :f => -15,
    :a => -18,
#    :z => -21,
#    :y => -24,
)
const si_orders = collect(values(si_scaling_orders))

"""
    to_SI(x::Real; sigdigits=5)
Convert the input number `x` to a string that is rounded by `sigdigits`
significant digits and converted to use SI scaling prefixes

# Examples
```jldoctest
julia> to_SI(1.5e9)
"1.5G"

julia> to_SI(0.00000025)
"250n"

julia> to_SI(1/3)
"0.33333"

julia> to_SI(1/3, sigdigits=12)
"0.333333333333"
"""
function to_SI(x::Real; sigdigits=4)
    order_largest = first(si_orders)
    order_smallest = last(si_orders)
    if abs(x) > exp10(order_largest+4) || abs(x) < exp10(order_smallest-3)
        return string(round(x; sigdigits))
    end
    for (sym, order) in si_scaling_orders
        if abs(x) >= exp10(order)
            # Always use pos exponents to avoid annoying roundoff errors
            if order >= 0
                r = round(x/exp10(order); sigdigits)
            else
                r = round(x*exp10(abs(order)); sigdigits)
            end
            if isinteger(r)
                r = round(Int, r)
            end
            # don't use `m` for between 0.1 and 1
            if sym == :m && 100 < abs(r) <= 1000
                r = round(r/1000; sigdigits)
                sym = Symbol("")
            end
            return string(r, sym)
        end
    end
    string(round(x; sigdigits))
end

end # module
