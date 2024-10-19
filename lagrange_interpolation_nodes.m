function lagrange_interpolation_nodes()
    % Number of nodes
    n = 10;  % Example with 11 nodes
    
    % Define the two functions
    f = @(x) 1 ./ (1 + 25 * x.^2);  % Runge's function
    g = @(x) sin(pi * x);           % sin(pi * x)
    
    % Define the range
    x_range = linspace(-1, 1, 500);  % Points to evaluate the interpolations
    
    % Compute interpolation with equally spaced nodes
    equally_spaced_nodes = linspace(-1, 1, n);
    f_interp_eq = lagrange_interpolation(equally_spaced_nodes, f(equally_spaced_nodes), x_range);
    g_interp_eq = lagrange_interpolation(equally_spaced_nodes, g(equally_spaced_nodes), x_range);
    
    % Compute interpolation with Chebyshev nodes
    chebyshev_nodes = cos((2*(0:n-1) + 1) / (2*n) * pi);
    f_interp_cheb = lagrange_interpolation(chebyshev_nodes, f(chebyshev_nodes), x_range);
    g_interp_cheb = lagrange_interpolation(chebyshev_nodes, g(chebyshev_nodes), x_range);
    
    % Plot results
    figure;
    
    % Plot for f(x) = 1/(1+25x^2)
    subplot(2, 1, 1);
    plot(x_range, f(x_range), 'k-', 'LineWidth', 1.5); hold on;
    plot(x_range, f_interp_eq, 'r--', 'LineWidth', 1.5);
    plot(x_range, f_interp_cheb, 'b-.', 'LineWidth', 1.5);
    legend('f(x) = 1/(1 + 25x^2)', 'Equally Spaced', 'Chebyshev Nodes');
    title('Lagrange Interpolation of f(x) with Different Nodes');
    xlabel('x'); ylabel('f(x)');
    
    % Plot for g(x) = sin(pi*x)
    subplot(2, 1, 2);
    plot(x_range, g(x_range), 'k-', 'LineWidth', 1.5); hold on;
    plot(x_range, g_interp_eq, 'r--', 'LineWidth', 1.5);
    plot(x_range, g_interp_cheb, 'b-.', 'LineWidth', 1.5);
    legend('g(x) = sin(\pi x)', 'Equally Spaced', 'Chebyshev Nodes');
    title('Lagrange Interpolation of g(x) with Different Nodes');
    xlabel('x'); ylabel('g(x)');
    
end

