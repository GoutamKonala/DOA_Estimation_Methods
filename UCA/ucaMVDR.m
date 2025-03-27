function P = ucaMVDR(x,D);

  [M,K] = size(x);
  Rxx = corrMat(x); % correlation matrix

  for y = 1:360
    clear A;
    py(y) =  y*pi/180;
    for x = 1:90
      th(x) = x*pi/180;
      for m = 1:M
        A(m) = exp(1j*(m-1)*2*pi*sin(th(x))*cos(py(y)-(2*pi*(m-1)/M)));
      end
      a = transpose(A);
      P(x, y) = 1/abs(a'*inv(Rxx)*a);
    end
  end
  figure;
  surf(P, 'FaceAlpha', 0.5 ); % visual representation of predicted incoming source angles according to algorithm
  xlim([0, 360]);
  ylim([0, 90]);
end
