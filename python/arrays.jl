function row_major_matrix_add!(C, A, B)
    @assert size(C)==size(A)==size(B)
    @inbounds for i in axes(A, 2)
        for j in axes(A, 1)
            C[i, j] = A[i, j] + B[i, j]
        end
    end
    nothing
end
function column_major_matrix_add!(C, A, B)
    @assert size(C)==size(A)==size(B)
    @inbounds for j = axes(A, 2)
        for i in axes(A, 1)
            C[i, j] = A[i, j] + B[i, j]
        end
    end
    nothing
end