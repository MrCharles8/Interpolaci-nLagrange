clc; clear; close all;

function [y_interp, error] = lagrange_interp(x_points, y_points, x, valor_real)
    n = length(x_points) - 1;
    y_interp = 0;
    
    for i = 0:n
        L = 1;
        for j = 0:n
            if j ~= i
                L = L * (x - x_points(j+1)) / (x_points(i+1) - x_points(j+1));
            end
        end
        y_interp = y_interp + y_points(i+1) * L;
    end
    
    error = abs((y_interp - valor_real) / valor_real) * 100;
end

% Ejemplo: puntos más cercanos
x_points = [1, 2, 3];
y_points = [0, 0.6931472, 1.098612];
[y_interp, error] = lagrange_interp(x_points, y_points, 2, 0.6931472);
fprintf('ln(2) ≈ %.7f, Error = %.7f%%\n', y_interp, error);