function soal_11_21()
% Soal 11.21 - Augmented Matrix [A | I] — Satu Baris Perintah MATLAB
% Jalankan: soal_11_21 (di Command Window MATLAB)
% --------------------------------------------------------

fprintf('=== SOAL 11.21 - Augmented Matrix [A | I] ===\n\n');

% Definisikan matriks A contoh 3x3
A = [3 1 2; 1 4 3; 2 3 5];

fprintf('Matriks A:\n');
disp(A);

% === JAWABAN: Satu baris perintah ===
Aug = [A, eye(size(A))];

fprintf('Perintah satu baris: Aug = [A, eye(size(A))]\n\n');
fprintf('Matriks [Aug] = [A | I]:\n');
disp(Aug);

% Penjelasan:
%   eye(size(A))  -> matriks identitas n x n (n = ukuran A)
%   [A, eye(...)] -> gabungkan A dan I secara horizontal

end
