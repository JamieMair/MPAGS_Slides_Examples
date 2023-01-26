using BenchmarkTools
LinearAlgebra.BLAS.set_num_threads(1)
function f!(C, A, B)
    @boundscheck C,A,B
    @inbounds for i in eachindex(C)
        C[i] = A[i] + sin(B[i])
    end
    nothing
end
function f_broadcast!(C, A, B)
    C .= A .* sin.(B)
    nothing
end

N = 512;
A = rand(N, N);
B = rand(N, N);
C = similar(A);
@benchmark f!($C, $A, $B)
@benchmark f_broadcast!($C, $A, $B)

struct MyStruct
    a::Float64
    b::Vector{Float64}
end
my_list = [MyStruct(i, rand(i*2)) for i in 1:100];
map(x->length(x.b), my_list);