% Author: Bikash Kunwar / bzk0067@auburn.edu
% Date: 2024-10-19
% Assignment Name: hw03

classdef hw03
    methods (Static)

        function y = p1(data, eval)
            % Lagrange interpolation method
            %
            % :param: data: a matrix of size n x 2, where n is the number of data points
            %         data(:,1) is the x values
            %         data(:,2) is the y values
            % :param: eval: a vector of x values to evaluate the interpolating polynomial
            % :return: a vector, the evaluations of resulting interpolating polynomial at x values in eval

            n = length(eval);
            y = zeros(n, 1);

            % Your code goes here
           y = lagrange_interpolation(data(:,1), data(:,2), eval);
        end

        function p2()
            % Use equally spaced nodes and Chebyshev nodes to compute the Lagrange polynomial interpolation of 
            % f(x) = 1/(1 + 25x^2) and g(x) = sin(pi * x) on [-1, 1]. 
            % This code uses your implementation of p1 to compute the
            % interpolation, and record the maximum interpolation error at 1000 equally spaced points in [-1, 1].
            % ----------------------------------------------------------------------------------

            % First, run this function and tabulate your result in the table below. 
            % Then, make a comment/explanation on the trend of the error for **equally spaced nodes** as n increases for each function.

            % Write your comments here.
            % The error for interpolation using equally spaced nodes for
            % the function f(x) grows very rapidly (to order of 1e6) as
            % number of nodes is
            % increased. The major contribution to the error comes from the edges or the boundary of interpolation interval. For second function g(x), the error first
            % decreases and then increases but remianing less than 1e-2 all
            % the time. The error in g(x) is smallar because it is a smooth
            % curve compared to f(x)
            %
            %
            %
            %
            %
            
% |n  |                        Function       | Error with equally spaced nodes | Error with Chebyshev nodes  |
% |---|---------------------------------------|---------------------------------|-----------------------------|
% |  5|                @(x)1./(1+25*x.^2)     | 4.3267e-01                      |  5.5589e-01                 |
% | 10|                @(x)1./(1+25*x.^2)     | 1.9156e+00                      |  1.0915e-01                 |
% | 15|                @(x)1./(1+25*x.^2)     | 2.1069e+00                      |  8.3094e-02                 |
% | 20|                @(x)1./(1+25*x.^2)     | 5.9768e+01                      |  1.5333e-02                 |
% | 25|                @(x)1./(1+25*x.^2)     | 7.5764e+01                      |  1.1411e-02                 |
% | 30|                @(x)1./(1+25*x.^2)     | 2.3847e+03                      |  2.0613e-03                 |
% | 35|                @(x)1./(1+25*x.^2)     | 3.1708e+03                      |  1.5642e-03                 |
% | 40|                @(x)1./(1+25*x.^2)     | 1.0438e+05                      |  2.8935e-04                 |
% | 45|                @(x)1./(1+25*x.^2)     | 1.4243e+05                      |  2.1440e-04                 |
% | 50|                @(x)1./(1+25*x.^2)     | 4.8178e+06                      |  3.9629e-05                 |
% | 55|                @(x)1./(1+25*x.^2)     | 6.6475e+06                      |  2.9383e-05                 |
% |---|---------------------------------------|---------------------------------|-----------------------------|
% |  5|                     @(x)sin(pi*x)     | 2.6754e-02                      |  1.3193e-02                 |
% | 10|                     @(x)sin(pi*x)     | 5.1645e-05                      |  6.0348e-06                 |
% | 15|                     @(x)sin(pi*x)     | 9.2162e-10                      |  2.0995e-11                 |
% | 20|                     @(x)sin(pi*x)     | 1.2645e-12                      |  1.3323e-15                 |
% | 25|                     @(x)sin(pi*x)     | 3.6816e-11                      |  1.2212e-15                 |
% | 30|                     @(x)sin(pi*x)     | 7.9886e-10                      |  1.5543e-15                 |
% | 35|                     @(x)sin(pi*x)     | 2.1296e-08                      |  1.3323e-15                 |
% | 40|                     @(x)sin(pi*x)     | 2.6873e-07                      |  1.6653e-15                 |
% | 45|                     @(x)sin(pi*x)     | 8.7662e-06                      |  2.1094e-15                 |
% | 50|                     @(x)sin(pi*x)     | 3.6685e-04                      |  2.1094e-15                 |
% | 55|                     @(x)sin(pi*x)     | 7.5022e-03                      |  2.4425e-15                 |
% |---|---------------------------------------|---------------------------------|-----------------------------|

            eval_pts = linspace(-1, 1, 1000)';
            funcs = { @(x) 1 ./ (1 + 25 * x.^2), @(x) sin(pi * x) };
            fprintf('|n  |                        Function       | Error with equally spaced nodes | Error with Chebyshev nodes  |\n');
            fprintf('|---|---------------------------------------|---------------------------------|-----------------------------|\n')
            for i = 1:2
                func = funcs{i};
                for n = 5:5:55
                    % Equally spaced nodes
                    x = linspace(-1, 1, n+1);
                    y = func(x);
                    y_eval = hw03.p1([x', y'], eval_pts);
                    eq_error_f = max(abs(func(eval_pts) - y_eval));
                    % Chebyshev nodes
                    x = cos((2 * (1:(n+1)) - 1) * pi / (2 * n + 2));
                    y = func(x);
                    y_eval = hw03.p1([x', y'], eval_pts);
                    cheby_error_f = max(abs(func(eval_pts) - y_eval));
                    fprintf('| %2d|    %30s     | %6.4e                      |  %6.4e                 |\n', n, functions(func).function, eq_error_f, cheby_error_f);
                end
                    fprintf('|---|---------------------------------------|---------------------------------|-----------------------------|\n')
            end
        end

        function p3()
            % **Only for 6630**.
            % Use the extreme Chebyshev nodes to compute the Lagrange polynomial interpolation of 
            % f(x) = 1/(1 + 25x^2) and g(x) = sin(pi * x) on [-1, 1]. 
            % This code uses your implementation of p1 to compute the
            % interpolation, and record the maximum interpolation error at 1000 equally spaced points in [-1, 1].
            % ----------------------------------------------------------------------------------

            % Run this function and tabulate your result in the table below. 
            % Then, make a comment on the performance of the extreme Chebyshev nodes compared to Chebyshev nodes.

            % Write your comment here.
            % It appears the magnitude of error with extreme Chebyshev
            % nodes is a bit higher (but of same order) as that of
            % Chebyshev nodes. The constraint at the end point in case of
            % extreme Chebyshev nodes might have introduced more erorr in
            % the internal nodes. 
            %
            %
            %
% |n  |                        Function       | Error with extreme Chebyshev nodes  |
% |---|---------------------------------------|-------------------------------------|
% |  5|                @(x)1./(1+25*x.^2)     | 6.3862e-01                          |
% | 10|                @(x)1./(1+25*x.^2)     | 1.3219e-01                          |
% | 15|                @(x)1./(1+25*x.^2)     | 9.9308e-02                          |
% | 20|                @(x)1./(1+25*x.^2)     | 1.7738e-02                          |
% | 25|                @(x)1./(1+25*x.^2)     | 1.3649e-02                          |
% | 30|                @(x)1./(1+25*x.^2)     | 2.4252e-03                          |
% | 35|                @(x)1./(1+25*x.^2)     | 1.8710e-03                          |
% | 40|                @(x)1./(1+25*x.^2)     | 3.3987e-04                          |
% | 45|                @(x)1./(1+25*x.^2)     | 2.5645e-04                          |
% | 50|                @(x)1./(1+25*x.^2)     | 4.6187e-05                          |
% | 55|                @(x)1./(1+25*x.^2)     | 3.5147e-05                          |
% |---|---------------------------------------|-------------------------------------|
% |  5|                     @(x)sin(pi*x)     | 1.3357e-02                          |
% | 10|                     @(x)sin(pi*x)     | 1.1730e-05                          |
% | 15|                     @(x)sin(pi*x)     | 2.1000e-11                          |
% | 20|                     @(x)sin(pi*x)     | 1.7764e-15                          |
% | 25|                     @(x)sin(pi*x)     | 1.2212e-15                          |
% | 30|                     @(x)sin(pi*x)     | 1.4433e-15                          |
% | 35|                     @(x)sin(pi*x)     | 1.7764e-15                          |
% | 40|                     @(x)sin(pi*x)     | 1.5543e-15                          |
% | 45|                     @(x)sin(pi*x)     | 2.2204e-15                          |
% | 50|                     @(x)sin(pi*x)     | 1.7764e-15                          |
% | 55|                     @(x)sin(pi*x)     | 2.1094e-15                          |
% |---|---------------------------------------|-------------------------------------|

            eval_pts = linspace(-1, 1, 1000)';
            funcs = { @(x) 1 ./ (1 + 25 * x.^2), @(x) sin(pi * x) };
            fprintf('|n  |                        Function       | Error with extreme Chebyshev nodes  |\n');
            fprintf('|---|---------------------------------------|-------------------------------------|\n')
            for i = 1:2
                func = funcs{i};
                for n = 5:5:55
                    % extreme Chebyshev nodes
                    x = cos(((1:n+1) - 1) * pi / (n));
                    y = func(x);
                    y_eval = hw03.p1([x', y'], eval_pts);
                    ex_cheby_error_f = max(abs(func(eval_pts) - y_eval));
                    fprintf('| %2d|    %30s     | %6.4e                          |\n', n, functions(func).function, ex_cheby_error_f);
                end
                fprintf('|---|---------------------------------------|-------------------------------------|\n')
            end
        end
    end
end