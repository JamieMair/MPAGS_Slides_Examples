using Base

struct OneHotVector<:AbstractVector{Bool}
    len::Int
    index::Int
end
Base.size(v::OneHotVector) = (v.len,)
Base.getindex(v::OneHotVector, i::Int) = (i==v.index)

function my_dot(A::AbstractArray, B::AbstractArray)
    @boundscheck A, B
    s = zero(promote_type(eltype(A), eltype(B)))
    @inbounds for i in eachindex(A,B)
        s += A[i]*B[i]
    end
    return s
end

N = 2048
A = rand(N);
B = rand(Bool, N);

using BenchmarkTools
@benchmark my_dot($A, $B)

C = OneHotVector(N, 10);

@benchmark my_dot($A, $C)

function my_dot(A::AbstractArray, B::OneHotVector)
    @boundscheck A, B
    return A[B.index]
end
function my_dot(A::OneHotVector, B::AbstractArray)
    return my_dot(B, A)
end

@benchmark my_dot($A, $C)