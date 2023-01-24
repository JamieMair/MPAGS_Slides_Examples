function f_vectorised(x)
    y = similar(x)
    @. y = exp(x)*sin(x)*x + x^4 + 5 * sqrt(3*x)
    return y
end
function f_native(x_array)
    y = similar(x_array)
    @inbounds for i in eachindex(x_array)
        x = x_array[i]
        y[i] = exp(x)*sin(x)*x + x^4 + 5 * sqrt(3*x)
    end
    return y
end
x_values = [i/2^16 for i in 0:2^16]
using BenchmarkTools

@btime f_vectorised($x_values);
@btime f_native($x_values);