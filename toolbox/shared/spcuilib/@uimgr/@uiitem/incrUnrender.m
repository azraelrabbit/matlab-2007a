function unrenderedCode = incrUnrender(h)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    unrenderedCode = 0.0;
    % 20 22
    if isUnrendered(h)
        % 22 37
        % 23 37
        % 24 37
        % 25 37
        % 26 37
        % 27 37
        % 28 37
        % 29 37
        % 30 37
        % 31 37
        % 32 37
        % 33 37
        % 34 37
        % 35 37
        unrenderedCode = 1.0;
    else
        if h.isGroup
            % 39 43
            % 40 43
            % 41 43
            childObjOrder = computeChildOrder(h, true, Inf);
            N = numel(childObjOrder);
            allchild_unrenderedCodes = zeros(1.0, N);
            % 45 47
            for i=1.0:N
                % 47 50
                % 48 50
                hChild = childObjOrder(i);
                % 50 54
                % 51 54
                % 52 54
                child_unrenderedCode = incrUnrender(hChild);
                % 54 59
                % 55 59
                % 56 59
                % 57 59
                childIsNonWidgetGroup = isempty(hChild.WidgetFcn);
                % 59 84
                % 60 84
                % 61 84
                % 62 84
                % 63 84
                % 64 84
                % 65 84
                % 66 84
                % 67 84
                % 68 84
                % 69 84
                % 70 84
                % 71 84
                % 72 84
                % 73 84
                % 74 84
                % 75 84
                % 76 84
                % 77 84
                % 78 84
                % 79 84
                % 80 84
                % 81 84
                % 82 84
                affects_younger_siblings = eq(child_unrenderedCode, 1.0) || (gt(child_unrenderedCode, 1.0) && childIsNonWidgetGroup);
                % 84 94
                % 85 94
                % 86 94
                % 87 94
                % 88 94
                % 89 94
                % 90 94
                % 91 94
                % 92 94
                if not(affects_younger_siblings)
                    child_unrenderedCode = 0.0;
                end
                allchild_unrenderedCodes(i) = child_unrenderedCode;
                % 97 100
                % 98 100
                if affects_younger_siblings
                    % 100 103
                    % 101 103
                    for j=plus(i, 1.0):N
                        % 103 110
                        % 104 110
                        % 105 110
                        % 106 110
                        % 107 110
                        % 108 110
                        hSib = childObjOrder(j);
                        % 110 112
                        unrender(hSib, true);
                    end % for
                    % 113 116
                    % 114 116
                    break
                end
            end % for
            % 118 122
            % 119 122
            % 120 122
            if any(gt(allchild_unrenderedCodes, 0.0))
                parentIsNonWidgetGroup = isempty(h.WidgetFcn);
                if parentIsNonWidgetGroup
                    % 124 127
                    % 125 127
                    unrenderedCode = 1.0;
                else
                    unrenderedCode = 2.0;
                end
            end
        end
    end
end
