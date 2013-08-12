function mu = calcCoherence(A)
% Calculates coherence of a matirx A as 
% max |<ai,aj>| / ||ai|| ||aj||, for all i neq j
%
% A    : Input matrix
% mu   : Coherence value

[nrow, ncol] = size(A);

% l2 norm of each column
normA = sqrt(sum(A.^2));

% An = A ./ repmat(normA, [size(A,1) 1]);

% normalize each column to unit vector
for i = 1:nrow
    A(i,:) = A(i,:) ./ normA;
end

% A(logical(eye(nrow,ncol))) = -Inf;

% ATA size = ncol x ncol
ATA = abs(A' * A); 

% make diag elements as -Inf to ignore them for max calculation
ATA(1:ncol+1:end) = -Inf; 

mu = max(max(ATA));