function P = lagrange_interpolation(x_values, y_values, x)
    % Lagrange Interpolation
    % x_values: vector of x-coordinates of known data points
    % y_values: vector of y-coordinates of known data points
    % x: vector of points at which interpolation is required
    % P: interpolated values at points in x
    
    n = length(x_values);  % number of data points
    P = zeros(size(x));    % initialize result to zeros
    
    for i = 1:n
        % Initialize the Lagrange basis polynomial
        L_i = ones(size(x));
        
        for j = 1:n
            if i ~= j
                % Lagrange basis polynomial L_i(x)
                L_i = L_i .* (x - x_values(j)) / (x_values(i) - x_values(j));
            end
        end
        
        % Add the contribution of y_values(i) * L_i to the total polynomial
        P = P + y_values(i) * L_i;
    end
end
