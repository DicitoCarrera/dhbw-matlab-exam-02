% -------------------------------------------------------------------------
% Lyapunov-Exponenten der Tschirikow-Standardabbildung vs. K
% -------------------------------------------------------------------------

% Parameter
K_values   = linspace(0, 4, 41);   % 41 Werte von 0 bis 4
N          = 2000;                % Gesamtschritte pro Trajektorie
transient  = 500;                 % Abwurftransienten
nK         = numel(K_values);
lyap       = zeros(2, nK);        % Speicher für λ₁ und λ₂

% Schleife über alle K-Werte
for kIdx = 1:nK
    K = K_values(kIdx);
    
    % Anfangszustand zufällig in [0,2π]^2
    I     = 2*pi*rand;
    theta = 2*pi*rand;
    
    % Q0 = Identity
    Q = eye(2);
    sum_log = zeros(2,1);
    
    % Iteration
    for n = 1:N
        % Systemdynamik
        I_next     = mod(I + K*sin(theta), 2*pi);
        theta_next = mod(theta + I_next,     2*pi);
        
        % Jacobi-Matrix DF
        DF = [1,           K*cos(theta);
              1, 1 + K*cos(theta)];
        
        % Propagiere lineare Abweichungen und QR-Zerlegung
        A = DF * Q;
        [Q, R] = qr(A);
        
        % Sammle ab dem Ende der Transienten
        if n > transient
            sum_log = sum_log + log(abs(diag(R)));
        end
        
        % Update Zustand
        I     = I_next;
        theta = theta_next;
    end
    
    % Normiere aufs mittlere Wachstum
    lyap(:,kIdx) = sum_log / (N - transient);
end

% Plot der beiden Exponenten
figure;
plot(K_values, lyap(1,:), 'b-', 'LineWidth',1.5); hold on;
plot(K_values, lyap(2,:), 'r-', 'LineWidth',1.5);
xlabel('K','FontSize',12);
ylabel('\lambda','FontSize',12);
legend('\lambda_1','\lambda_2','Location','Best');
title('Lyapunov-Exponenten \lambda_1 und \lambda_2 vs. K','FontSize',14);
grid on;
