function soal_11_19()
% Soal 11.19 - Hilbert Matrix Condition Number (n=10)
% Jalankan: soal_11_19 (di Command Window MATLAB)
% --------------------------------------------------------

n = 10;

% Buat matriks Hilbert 10x10
H = hilb(n);

% Spectral condition number
cond_num = cond(H);
digits_lost = log10(cond_num);

fprintf('=== SOAL 11.19 - Hilbert Matrix (n=10) ===\n\n');
fprintf('Spectral Condition Number : %.6e\n', cond_num);
fprintf('Digit presisi hilang      : %.2f\n\n', digits_lost);

% RHS: b = H * ones(n,1) -> solusi x seharusnya semua = 1
x_exact = ones(n, 1);
b = H * x_exact;

% Selesaikan sistem
x_computed = H \ b;

% Tampilkan solusi dan error
fprintf('Solusi (seharusnya semua = 1):\n');
fprintf('%4s  %18s  %14s\n', 'i', 'x_computed', 'abs_error');
for i = 1:n
    fprintf('%4d  %18.10f  %14.6e\n', i, x_computed(i), abs(x_computed(i) - 1));
end

max_err  = max(abs(x_computed - x_exact));
norm_err = norm(x_computed - x_exact);
fprintf('\nMax absolute error : %.6e\n', max_err);
fprintf('Norm error         : %.6e\n', norm_err);

machine_eps   = eps('double');
predicted_err = cond_num * machine_eps;
fprintf('\nMachine epsilon        : %.2e\n', machine_eps);
fprintf('Prediksi error (c x e) : %.2e\n', predicted_err);
fprintf('Actual norm error      : %.2e\n', norm_err);
fprintf('\nKesimpulan: Hilbert 10x10 ILL-CONDITIONED (~%.0f digit hilang)\n', digits_lost);

end
