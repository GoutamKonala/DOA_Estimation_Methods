function P = ucaMUSIC(x,D);

  [M,K] = size(x);
  Rxx = corrMat(x); % correlation matrix

  [RxxEigVec,RxxEigVal] = eig(Rxx); % Eigen vectors and Eigen values of correlation matrix
  [Y,Index] = sort(diag(RxxEigVal));  % Sorting eigen vectors according to eigen values
  En = RxxEigVec(:,Index(1:M-D)); % Constructing noise subspace

  for y = 1:360
    clear A;
    py(y) =  y*pi/180;
    for x = 1:90
      th(x) = x*pi/180;
      for m = 1:M
        A(m) = exp(1j*(m-1)*2*pi*sin(th(x))*cos(py(y)-(2*pi*(m-1)/M)));
      end
      a = transpose(A);
      P(x, y) = 1/abs(a'*En*En'*a);
    end
  end
  figure;
  surf(P, 'FaceAlpha', 0.5 ); % visual representation of predicted incoming source angles according to algorithm
  xlim([0, 360]);
  ylim([0, 90]);
end
