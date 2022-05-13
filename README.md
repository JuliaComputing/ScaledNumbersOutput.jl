# ScaledNumbersOutput

This package provides a utility function for pretty printing
numbers.  The `to_SI(val; sigdigits)` takes a number and converts
it to the a string using SI scaling prefixes.  For example:

```julia
julia> to_SI(75.2e10)
"752G"

julia> to_SI(0.000000021)
"21n"
```

By default numbers are rounded to 5 digits but that can be chosen:

```julia
julia> to_SI(1/9)
"0.11111"

julia> to_SI(1/9, sigdigits=7)
"0.1111111"
```

The following scale factors are supported:

| Symbol | Scaling Factor|
|:------:|--------------:|
| P      | 10^15         |
| T      | 10^12         |
| G      | 10^9          |
| M      | 10^6          |
| k      | 10^3          |
| m      | 10^-3         |
| u      | 10^-6         |
| n      | 10^-9         |
| p      | 10^-12        |
| f      | 10^-15        |
| a      | 10^-18        |

## See also

The following packages are similar:

- [ScalingNumbersInput](https://github.com/JuliaComputing/ScaledNumbersInput.jl) - for using scaling factors when reading numbers
- [NumericIO](https://github.com/ma-laforge/NumericIO.jl) - similar functionality