function [y_hat, p_hat] = multiclassSVM( XTr, yTr, gamma, C )
%MULTICLASSSVM Summary of this function goes here
%   Detailed explanation goes here
for class =1:4
    yTrClass = yTr;
    if length(yTrClass)~= length(XTr)
        fprintf('X and Y have different length !');
    end
    for row = 1: length(XTr)
        if(yTrClass(row,1) == class)
            yTrClass(row,1) = -1;
        else
            yTrClass(row,1) = 1;
        end
    end
        
    [y_hat(:, class), p_hat(:, class)] = SVM(XTr, yTrClass, XTr, C, gamma);
end


% Classify into the clusters
    for i = 1:length(y_hat)
        [pred(i,1), idx(i,1)] = max(p_hat(i, :));
    end
    
    y_hat = idx;
    p_hat = pred;
end

