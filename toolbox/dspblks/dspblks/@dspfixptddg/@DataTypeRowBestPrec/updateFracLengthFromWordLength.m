function updateFracLengthFromWordLength(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if strcmpi(this.Mode, 'Specify word length')
        % 7 18
        % 8 18
        % 9 18
        % 10 18
        % 11 18
        % 12 18
        % 13 18
        % 14 18
        % 15 18
        % 16 18
        try
            wlVal = double(evalin('base', this.WordLength));
        catch
            wlVal = [];
        end % try
        % 22 24
        if ~(isempty(wlVal))
            if ~(isempty(this.ParamPropNames)) && ~(isempty(this.ParamBlock))
                % 25 27
                scaleVals = [];
                stringCellArray = this.ParamPropNames;
                % 28 30
                if eq(length(stringCellArray), 1.0) && strcmp(stringCellArray{1.0}, 'intentionally blank')
                    % 30 32
                    scaleVals = [];
                else
                    for count=1.0:length(stringCellArray)
                        % 34 36
                        nextStr = stringCellArray{count};
                        try
                            temp = eval(this.ParamBlock.(nextStr));
                            nextVals = str2num(this.ParamBlock.(nextStr));
                        catch
                            scaleVals = [];
                            break
                        end % try
                        % 43 46
                        % 44 46
                        nextVals = nextVals(:);
                        % 46 49
                        % 47 49
                        scaleVals = vertcat(scaleVals, nextVals);
                    end % for
                end
                % 51 53
                if ~(isempty(scaleVals))
                    scaleValsCol = double(scaleVals(:));
                    if isreal(scaleVals)
                        minVal = min(scaleValsCol);
                        maxVal = max(scaleValsCol);
                    else
                        realScaleVals = real(scaleValsCol);
                        imagScaleVals = imag(scaleValsCol);
                        % 60 63
                        % 61 63
                        realMinVal = min(realScaleVals);
                        imagMinVal = min(imagScaleVals);
                        minVal = min(vertcat(realMinVal, imagMinVal));
                        % 65 68
                        % 66 68
                        realMaxVal = max(realScaleVals);
                        imagMaxVal = max(imagScaleVals);
                        maxVal = max(vertcat(realMaxVal, imagMaxVal));
                    end
                    % 71 75
                    % 72 75
                    % 73 75
                    if gt(abs(minVal), abs(maxVal))
                        valueToUse = minVal;
                    else
                        valueToUse = maxVal;
                    end
                    % 79 82
                    % 80 82
                    fl_best_prec = uminus(fixptbestexp(valueToUse, wlVal, 1.0));
                    fl = num2str(fl_best_prec);
                else
                    fl = this.BestPrecString;
                end
            else
                if ~(isnan(this.WordLengthOffset))
                    fl = num2str(minus(wlVal, this.WordLengthOffset));
                else
                    warning('You must specify either WordLengthOffset or both ParamPropNames and ParamBlock');
                    fl = 'Internal Error';
                end
            end
        else
            fl = this.BestPrecString;
        end
        this.FracLength = fl;
    else
        this.FracLength = this.FracLengthEdit;
    end
end
