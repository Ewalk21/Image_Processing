[X,Y] = meshgrid(linspace(-5, 5, 50));              % Create Mesh Data
fcn = @(x,y,k) k*x.^2 + y.^2;                       % Function To Plot (Vary Sign Of �x�)

v = [1:-0.05:-1;  -1:0.05:1];                       % Multiplier For �x�
for k1 = 1:2                                        % One Cycle For �Up�, One FOr �Down�
    for k2 = v(k1,:)                                % Select A Direction From �v�
        surfc(X, Y, fcn(X,Y,k2))                    % Draw Surface
        axis([-5  5    -5  5    -30  50])           % Set �axis� For All Plots
        drawnow                                     % Draw Plot
        pause(0.1)                                  % Create Evenly-Timed Steps For Animation
    end
end