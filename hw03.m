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
            %
            %
            %
            %
            %
            %
            

            % |n  |                        Function       | Error with equally spaced nodes | Error with Chebyshev nodes  |
            % |---|---------------------------------------|---------------------------------|-----------------------------|
            % |  5|                @(x)1./(1+25*x.^2)     |                                 |                             |
            % | 10|                @(x)1./(1+25*x.^2)     |                                 |                             |
            % | 15|                @(x)1./(1+25*x.^2)     |                                 |                             |
            % | 20|                @(x)1./(1+25*x.^2)     |                                 |                             |
            % | 25|                @(x)1./(1+25*x.^2)     |                                 |                             |
            % | 30|                @(x)1./(1+25*x.^2)     |                                 |                             |
            % | 35|                @(x)1./(1+25*x.^2)     |                                 |                             |
            % | 40|                @(x)1./(1+25*x.^2)     |                                 |                             |
            % | 45|                @(x)1./(1+25*x.^2)     |                                 |                             |
            % | 50|                @(x)1./(1+25*x.^2)     |                                 |                             |
            % | 55|                @(x)1./(1+25*x.^2)     |                                 |                             |
            % |---|---------------------------------------|---------------------------------|-----------------------------|
            % |  5|                     @(x)sin(pi*x)     |                                 |                             |
            % | 10|                     @(x)sin(pi*x)     |                                 |                             |
            % | 15|                     @(x)sin(pi*x)     |                                 |                             |
            % | 20|                     @(x)sin(pi*x)     |                                 |                             |
            % | 25|                     @(x)sin(pi*x)     |                                 |                             |
            % | 30|                     @(x)sin(pi*x)     |                                 |                             |
            % | 35|                     @(x)sin(pi*x)     |                                 |                             |
            % | 40|                     @(x)sin(pi*x)     |                                 |                             |
            % | 45|                     @(x)sin(pi*x)     |                                 |                             |
            % | 50|                     @(x)sin(pi*x)     |                                 |                             |
            % | 55|                     @(x)sin(pi*x)     |                                 |                             |
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
            %
            %
            %
            %
            %

            % |n  |                        Function       | Error with extreme Chebyshev nodes  |
            % |---|---------------------------------------|-------------------------------------|
            % |  5|                @(x)1./(1+25*x.^2)     |                                     |
            % | 10|                @(x)1./(1+25*x.^2)     |                                     |
            % | 15|                @(x)1./(1+25*x.^2)     |                                     |
            % | 20|                @(x)1./(1+25*x.^2)     |                                     |
            % | 25|                @(x)1./(1+25*x.^2)     |                                     |
            % | 30|                @(x)1./(1+25*x.^2)     |                                     |
            % | 35|                @(x)1./(1+25*x.^2)     |                                     |
            % | 40|                @(x)1./(1+25*x.^2)     |                                     |
            % | 45|                @(x)1./(1+25*x.^2)     |                                     |
            % | 50|                @(x)1./(1+25*x.^2)     |                                     |
            % | 55|                @(x)1./(1+25*x.^2)     |                                     |
            % |---|---------------------------------------|-------------------------------------|
            % |  5|                     @(x)sin(pi*x)     |                                     |
            % | 10|                     @(x)sin(pi*x)     |                                     |
            % | 15|                     @(x)sin(pi*x)     |                                     |
            % | 20|                     @(x)sin(pi*x)     |                                     |
            % | 25|                     @(x)sin(pi*x)     |                                     |
            % | 30|                     @(x)sin(pi*x)     |                                     |
            % | 35|                     @(x)sin(pi*x)     |                                     |
            % | 40|                     @(x)sin(pi*x)     |                                     |
            % | 45|                     @(x)sin(pi*x)     |                                     |
            % | 50|                     @(x)sin(pi*x)     |                                     |
            % | 55|                     @(x)sin(pi*x)     |                                     |
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