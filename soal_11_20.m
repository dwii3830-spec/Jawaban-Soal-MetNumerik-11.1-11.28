function soal_11_20()
% Soal 11.20 - Vandermonde Matrix Condition Number (n=6)
% Jalankan: soal_11_20 (di Command Window MATLAB)
% --------------------------------------------------------

x_pts = [4; 2; 7; 10; 3; 5];
n     = length(x_pts);

% Buat matriks Vandermonde n x n
% V(i,j) = x_pts(i)^(n-j)  ->  kolom pertama = x^(n-1), terakhir = x^0
V = zeros(n, n);
for i = 1:n
    for j = 1:n
        V(i,j) = x_pts(i)^(n-j);
    end
end

fprintf('=== SOAL 11.20 - Vandermonde Matrix (n=6) ===\n\n');
fprintf('Titik x: ');
fprintf('%g  ', x_pts);
fprintf('\n\n');

fprintf('Matriks Vandermonde V:\n');
disp(V);

% Spectral condition number
cond_num    = cond(V);
digits_lost = log10(cond_num);
fprintf('Spectral Condition Number : %.6e\n', cond_num);
fprintf('Digit presisi hilang      : %.2f\n\n', digits_lost);

% RHS
x_exact = ones(n, 1);
b       = V * x_exact;

% Solusi
x_computed = V \ b;

fprintf('Solusi (seharusnya semua = 1):\n');
fprintf('%4s  %18s  %14s\n', 'i', 'x_computed', 'abs_error');
for i = 1:n
    fprintf('%4d  %18.10f  %14.6e\n', i, x_computed(i), abs(x_computed(i)-1));
end

max_err  = max(abs(x_computed - x_exact));
norm_err = norm(x_computed - x_exact);
fprintf('\nMax error  : %.6e\n', max_err);
fprintf('Norm error : %.6e\n', norm_err);

if cond_num > 1e10
    fprintf('\nKesimpulan: Matriks ILL-CONDITIONED (cond ~ %.1e)\n', cond_num);
else
    fprintf('\nKesimpulan: Matriks relatif well-conditioned (cond ~ %.1e)\n', cond_num);
end

end
