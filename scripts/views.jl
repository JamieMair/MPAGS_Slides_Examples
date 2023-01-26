a = rand(10:99, 4,4)
b = a[1:2, 1:2]
b .= 0
a

c = @view a[1:2, 1:2]
c .= 0
a

d = @view a[1:2:4, 3]
d .= 1
a

a[2:2:4, 4] .= 0
a

A = rand(1024, 1024);
B = Vector{eltype(A)}(undef, size(A, 1));
function sum_rows!(B, A)
    @inbounds for i in eachindex(B)
        B[i] = sum(view(A, i, axes(A, 2)))
    end
    nothing
end
function sum_rows_inbuilt!(B, A)
    sum!(reshape(B, :, 1), A)
end
@benchmark sum_rows!($B, $A)
@benchmark sum_rows_inbuilt!($B, $A)